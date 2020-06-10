/* Generated By:JJTree: Do not edit this line. ASTClassInfo.java Version 6.1 */
/* JavaCCOptions:MULTI=true,NODE_USES_PARSER=false,VISITOR=false,TRACK_TOKENS=false,NODE_PREFIX=AST,NODE_EXTENDS=,NODE_FACTORY=,SUPPORT_CLASS_VISIBILITY_PUBLIC=true */
public
class ASTClassInfo extends SimpleNode {
  public ASTClassInfo(int id) {
    super(id);
  }

  public ASTClassInfo(JavaMMParser p, int id) {
    super(p, id);
  }

  @Override
  public String generateCode() {
    String classDef = ".class public " + this.children[0] + "\n";
    String extendsDef = ".super " + this.getSuperClass() + "\n";
    return classDef + extendsDef;
  }

  public String getSuperClass() {
    if (children.length == 1)
      return "java/lang/Object";
    return this.children[1].toString();
  }

  public boolean explore(int order, SymbolTable symbolTable) {
    symbolTable.setClassName(this.children[0].toString());
    return super.explore(order, symbolTable);
  }

}
/* JavaCC - OriginalChecksum=2b879a42c29a81a28bdce2de1d3d6b13 (do not edit this line) */
