/* Generated By:JJTree: Do not edit this line. ASTObjectInit.java Version 6.1 */
/* JavaCCOptions:MULTI=true,NODE_USES_PARSER=false,VISITOR=false,TRACK_TOKENS=false,NODE_PREFIX=AST,NODE_EXTENDS=,NODE_FACTORY=,SUPPORT_CLASS_VISIBILITY_PUBLIC=true */
import java.util.HashMap;
import java.util.List;

public
class ASTObjectInit extends SimpleNode {
  public ASTObjectInit(int id) {
    super(id);
  }

  public ASTObjectInit(JavaMMParser p, int id) {
    super(p, id);
  }

  @Override
  public String generateCode() {
    StringBuilder code = new StringBuilder();
    code.append("new " + this.children[0] + "\n");
    code.append("dup\n");
    code.append(this.children[1].generateCode());
    code.append("invokespecial " + jvmSignature() + "\n");

    return code.toString();
  }

  private String jvmSignature() {
    StringBuilder signature = new StringBuilder();
    signature.append(this.children[0] + "/<init>("); // Class name

    for (Node arg : this.children[1].jjtGetChildren()) { // Arguments
      signature.append(ASTType.generateCodeChar(arg.getType()));
    }
    signature.append(")V");
    return signature.toString();
  }

  private String constructorSignature() {
    String className = this.children[0].toString();
    Node[] args = this.children[1].jjtGetChildren(); // Args

    if (args.length == 0)
      return className;
    StringBuilder signature = new StringBuilder();
    signature.append(className); // Class name
    signature.append("(");
    for (int i = 0; i < args.length; i++) {
      signature.append(args[i].getType());
      if (i != args.length - 1)
        signature.append(",");
    }

    signature.append(")");
    return signature.toString();
  }

  public String getType() {
    return this.children[0].toString();
  }

  @Override
  public StackLimitValues calculateStackLimit(StackLimitValues slv){
    slv.incStack(2);
    slv = children[1].calculateStackLimit(slv);
    slv.decStack(children[1].jjtGetNumChildren() + 1);
    return slv;
  }


  public boolean isSemanticallyCorrect(HashMap<String, Integer> varInitTable) {
    if (!this.children[1].isSemanticallyCorrect(varInitTable))
      return false;
    String className = this.children[0].toString();
    String signature = this.constructorSignature();
    if (className.equals(this.symbolTable.getClassName())) {
      // Only default constructor can exist
      if (signature.equals(className))
        return true;
      System.err.println("Error: Such constructor does not exist: " + signature + " at line " + ((SimpleNode)this.children[0]).line + ", column " + ((SimpleNode)this.children[0]).column + ".");
      return false;
    }
    if (!this.symbolTable.checkConstructorImport(signature)) {
      System.err.println("Error: Such constructor does not exist: " + signature + " at line " + ((SimpleNode)this.children[0]).line + ", column " + ((SimpleNode)this.children[0]).column + ".");
      return false;
    }
    return true;
  }

  public void fillGraph(HashMap<String, LiveNode> graph, List<LiveNode> activeList) {
    ((SimpleNode) this.children[1]).fillGraph(graph, activeList);
  }
}
/* JavaCC - OriginalChecksum=60887465da863ea0a72e8e5827ee3e45 (do not edit this line) */