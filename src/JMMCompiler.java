import java.io.*;
import java.util.*;

public class JMMCompiler {
    private static String removeExtension(String fileName) {
        int extIndex = fileName.lastIndexOf(".");
        return extIndex < 0 ? fileName : fileName.substring(0, extIndex);
    }

    public static void main(String[] args) throws Exception {
        boolean rOptimization = false;
        int numRegisters = 0;
        boolean oOptimization = false;

        if(args.length < 1) {
            System.err.println("Not enough arguments provided.");
            System.err.println("Usage: \"java -jar jmm.jar [-r <num>] [-o] <input_file.jmm>\"");
            return;
        }
        String inputFile = args[args.length - 1];

        for(int i = 0; i < args.length - 1; i++) {
            if(args[i].equals("-r")) {
                if(i + 1 >= args.length - 1) {
                    System.err.println("No argument provided for -r option.");
                    return;
                }
                i++;
                rOptimization = true;
                try {
                    numRegisters = Integer.parseInt(args[i]);
                }
                catch (NumberFormatException ignored) { /* if exception is thrown, numRegisters = 0 */ }
                if (numRegisters <= 0 || numRegisters > 255) {
                    System.err.println("Invalid argument provided for -r option: Must be positive integer smaller than 255.");
                    return;
                }
            } else if (args[i].equals("-o")) {
                oOptimization = true;
            } else {
                System.err.println("Invalid argument \"" + args[i] + "\".");
                return;
            }
        }
        String outputJFile = removeExtension(inputFile) + ".j";
        String outputFile = removeExtension(inputFile) + ".class";

        ASTProgram root = new JavaMMParser(new FileInputStream(new File(inputFile))).Program();
        SymbolTable table = new SymbolTable(root);

        if(!table.createTable(null))
            throw new RuntimeException("Semantically Invalid Program: Invalid import/method/variable declarations.");

        //System.out.println(table.getTableInfo(""));


        if (!root.isSemanticallyCorrect(new HashMap<String,Integer>()))
            throw new RuntimeException("Semantically Invalid Program");

        if(oOptimization)
            root.optimize();

        if(rOptimization)
            root.rOptimization(numRegisters);
        //root.dump("");


        String code = root.generateCode();
        printToFile(code, outputJFile);
        System.out.println("Successfully compiled program to " + outputJFile);

        compileJVM(outputJFile);
        System.out.println("Successfully compiled JVM program to " + outputFile);
    }

    private static void compileJVM(String outputJFile) {
        File file = new File(outputJFile);
        String outputFolderProp = file.getParent() == null ? "" : "-d " + file.getParent();
        try {
            Runtime.getRuntime().exec("java -jar jasmin-2.4/jasmin.jar " + outputFolderProp + " " + outputJFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void printToFile(String string, String outputFile) {
        try {
            PrintWriter printWriter = new PrintWriter(new FileWriter(outputFile), false);
            printWriter.write(string);
            printWriter.flush();
            //System.out.println(string);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}