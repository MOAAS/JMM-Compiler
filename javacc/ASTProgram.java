/* Generated By:JJTree: Do not edit this line. ASTProgram.java Version 6.1 */
/* JavaCCOptions:MULTI=true,NODE_USES_PARSER=false,VISITOR=false,TRACK_TOKENS=false,NODE_PREFIX=AST,NODE_EXTENDS=,NODE_FACTORY=,SUPPORT_CLASS_VISIBILITY_PUBLIC=true */
import java.util.HashMap;
public
class ASTProgram extends SimpleNode {
  public ASTProgram(int id) {
    super(id);
  }

  public ASTProgram(JavaMMParser p, int id) {
    super(p, id);
  }

  public void optimize() {
    this.constantPropagation(new HashMap<>());
    this.expressionSimplification();
    this.deadCodeElimination();
    this.loopUnrolling();
  }
}
/* JavaCC - OriginalChecksum=39d2ae46f8653f64516cb9c1b906b279 (do not edit this line) */