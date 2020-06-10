import jasmin.JasminUtils;
import org.junit.Before;
import org.junit.Test;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

public class Tester {
    private static PrintStream oldSysout;
    private static PrintStream oldSyserr;

    public static ByteArrayOutputStream redirectSysOut() {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);

        oldSysout = System.out;
        System.setOut(ps);

        return baos;
    }

    public static void resetSysout() {
        System.out.flush();

        if (oldSysout == null)
            return;

        System.setOut(oldSysout);
    }

    public static ByteArrayOutputStream redirectSysErr() {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);

        oldSyserr = System.err;
        System.setErr(ps);

        return baos;
    }

    public static void resetSysErr() {
        System.err.flush();

        if (oldSyserr == null)
            return;

        System.setOut(oldSyserr);
    }

    @Before
    public void ResetLabel() {
        SimpleNode.resetLabel();
    }

    /////////////
    //** AST **//
    /////////////

    @Test
    public void TestTreeConstantFold() throws Exception {
        testTree("test/files/ast/expressionsimp", true);
    }

    @Test
    public void TestTreeConstantProp() throws Exception {
        testTree("test/files/ast/constantProp", true);
    }

    @Test
    public void TestTreeIfDeadCode() throws Exception {
        testTree("test/files/ast/ifdeadcode", true);
    }

    @Test
    public void TestTreeSimple() throws Exception {
        testTree("test/files/ast/simple", false);
    }

    @Test
    public void TestTreeLoopUnrolling() throws Exception {
        testTree("test/files/ast/loopunrolling", true);
    }

    ////////////////////////////
    //** SYNTACTIC ANALYSIS **//
    ////////////////////////////


    @Test
    public void TestWhileErrors1() throws Exception {
        String inputFile = "test/files/syntactic/whileErrors1.jmm";
        String outputFile = "test/files/syntactic/whileErrors1.out";


        ByteArrayOutputStream outputStream1 = redirectSysErr();
        try {
            new JavaMMParser(new FileInputStream(new File(inputFile))).Program().dump("");
            resetSysErr();
            fail();
        } catch (RuntimeException e) {
            resetSysErr();
            assertFileContents(outputFile, outputStream1.toString());
        }

    }

    @Test
    public void TestWhileErrors2() throws Exception {
        String inputFile = "test/files/syntactic/whileErrors2.jmm";
        String outputFile = "test/files/syntactic/whileErrors2.out";

        ByteArrayOutputStream outputStream2 = redirectSysErr();
        try {
            new JavaMMParser(new FileInputStream(new File(inputFile))).Program().dump("");
            resetSysErr();
            fail();
        } catch (RuntimeException e) {
            resetSysErr();
            assertFileContents(outputFile, outputStream2.toString());
        }
    }

    ///////////////////
    //** CODE EXEC **//
    ///////////////////

    @Test
    public void TestCodeExecNotSoSimple() throws Exception {
        runParserAndProgram("files/codeexec/notsosimple", false, false);
    }

    @Test
    public void TestCodeExecInstructionOpt() throws Exception {
        runParserAndProgram("files/codeexec/instructionOpt", false, true);
    }

    //////////////////
    //** CODE GEN **//
    //////////////////

    @Test
    public void TestTopNotch1() throws Exception {
        assertFileContents("test/files/top-notch/Example1/Example1.j", runParser("test/files/top-notch/Example1/Example1.jmm"));
    }

    @Test
    public void TestTopNotch2() throws Exception {
        assertFileContents("test/files/top-notch/Example2/Example2.j", runParser("test/files/top-notch/Example2/Example2.jmm"));
    }

    @Test
    public void TestTopNotch3() throws Exception {
        assertFileContents("test/files/top-notch/Example3/Example3.j", runParser("test/files/top-notch/Example3/Example3.jmm"));
    }

    @Test
    public void TestTopNotch4() throws Exception {
        assertFileContents("test/files/top-notch/Example4/Example4.j", runParser("test/files/top-notch/Example4/Example4.jmm"));
    }

    @Test
    public void TestCodeGen1() throws Exception {
        assertFileContents("test/files/codegen/test1.j", runParser("test/files/codegen/test1.jmm"));
    }

    @Test
    public void TestCodeGenArgCons() throws Exception {
        assertFileContents("test/files/codegen/argCons.j", runParser("test/files/codegen/argCons.jmm"));
    }

    @Test
    public void TestCodeGenROpt1() throws Exception {
        assertFileContents("test/files/codegen/rOpt1.j", runParser("test/files/codegen/rOpt1.jmm", true, false));
    }

    //////////////////
    //** SEMANTIC **//
    //////////////////

    @Test
    public void TestSemanticDuplicates() throws Exception {
        testSemantic("test/files/semantic/duplicates.jmm", "test/files/semantic/duplicates.out");
    }

    @Test
    public void TestSemanticInvalidTypes() throws Exception {
        testSemantic("test/files/semantic/invalidtypes.jmm", "test/files/semantic/invalidtypes.out");
    }

    @Test
    public void TestSemanticMethodInvokation() throws Exception {
        testSemantic("test/files/semantic/methodInvokation.jmm", "test/files/semantic/methodInvokation.out");
    }

    @Test
    public void TestSemanticOverload() throws Exception {
        testSemantic("test/files/semantic/overload.jmm", "test/files/semantic/overload.out");
    }

    @Test
    public void TestSemanticThisInMain() throws Exception {
        testSemantic("test/files/semantic/thisInMain.jmm", "test/files/semantic/thisInMain.out");
    }

    @Test
    public void TestSemanticUninitialized() throws Exception {
        testSemantic("test/files/semantic/uninitialized.jmm", "test/files/semantic/uninitialized.out");
    }

    @Test
    public void TestSemanticGeneric() throws Exception {
        testSemantic("test/files/semantic/generic.jmm", "test/files/semantic/generic.out");
    }

    @Test
    public void TestSemanticIfWhileWarnings() throws Exception {
        ByteArrayOutputStream outputStream = redirectSysErr();

        runParser("test/files/semantic/ifwhilewarnings.jmm", false, true);

        resetSysErr();

        assertFileContents("test/files/semantic/ifwhilewarnings.out", outputStream.toString());
    }

    private void testTree(String input, boolean o) throws Exception {
        ByteArrayOutputStream outputStream = redirectSysOut();
        ASTProgram root = new JavaMMParser(new FileInputStream(new File(input + ".jmm"))).Program();

        if (o) {
            root.optimize();
        }

        root.dump("");
        resetSysout();

        assertFileContents(input + ".out", outputStream.toString());
    }

    private void testSemantic(String inputFile, String outputFile) throws Exception {
        ByteArrayOutputStream outputStream = redirectSysErr();

        try {
            runParser(inputFile);
            resetSysout();
            fail();
        } catch (RuntimeException e) {
            resetSysout();
            assertFileContents(outputFile, outputStream.toString());
        }
    }


    private void assertFileContents(String file, String content) throws IOException {
        String expectedOutput = getEntireFile(file);
        System.out.println(expectedOutput.replaceAll("\r", ""));
        System.out.println(content.replaceAll("\r", ""));
        assertEquals(expectedOutput.replaceAll("\r", ""), content.replaceAll("\r", ""));
    }

    private String getEntireFile(String file) throws IOException {
        return new String(Files.readAllBytes(Paths.get(file)));
    }

    private String runParser(String inputFile, boolean r, boolean o) throws Exception {
        ASTProgram root = new JavaMMParser(new FileInputStream(new File(inputFile))).Program();
        if(!new SymbolTable(root).createTable(null))
            throw new RuntimeException("Semantically Invalid Program: Invalid import/method/variable declarations.");

        if (!root.isSemanticallyCorrect(new HashMap<>()))
            throw new RuntimeException("Semantically Invalid");

        if (r) {
            root.rOptimization(5);
        }

        if (o) {
            root.optimize();
        }


        return root.generateCode();
    }

    private String runParser(String inputFile) throws Exception {
        return runParser(inputFile, false, false);
    }

    public void runParserAndProgram(String filename, boolean r, boolean o) throws Exception {
        assertFileContents("test/" + filename + ".j", runParser("test/" + filename + ".jmm", r, o));
        JasminUtils.testJmm(filename + ".jmm", getEntireFile("test/" + filename + ".out"));
    }
}
