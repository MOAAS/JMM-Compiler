/* Generated By:JJTree: Do not edit this line. ASTFalse.java Version 6.1 */
/* JavaCCOptions:MULTI=true,NODE_USES_PARSER=false,VISITOR=false,TRACK_TOKENS=false,NODE_PREFIX=AST,NODE_EXTENDS=,NODE_FACTORY=,SUPPORT_CLASS_VISIBILITY_PUBLIC=true */

public
class ASTFalse extends SimpleNode {
  public ASTFalse(int id) {
    super(id);
  }

  public ASTFalse(JavaMMParser p, int id) {
    super(p, id);
  }

  public ASTFalse() {
    super(JavaMMParserTreeConstants.JJTFALSE);
  }

  @Override
  public String getType() {
    return "boolean";
  }

  @Override
  public String generateCode() {
    return "iconst_0\n";
  }

  @Override
  public StackLimitValues calculateStackLimit(StackLimitValues slv){
    return slv.incStack(1);
  }

}
/* JavaCC - OriginalChecksum=c69f8b1a79be9404c61cf4893a133835 (do not edit this line) */