

public class MethodSymbol extends FunctionSymbol {
    private final SymbolTable methodTable; //with params and local vals
    private final SymbolTable parentTable;

    public MethodSymbol(String returnType, boolean isStatic, SimpleNode methodRoot, SymbolTable parentTable, int orderN) {
        super(returnType,isStatic,orderN);
        this.parentTable = parentTable;
        methodTable = new SymbolTable(methodRoot);
    }

    public boolean createSymbolTable() {
        return methodTable.createTable(parentTable);
    }

    public SymbolTable getMethodTable() {
        return methodTable;
    }

    public String getInfo() {
        String isStaticString = isStatic ? "true" : "false";
        return super.getInfo() + " | Return Type: " + returnType + " | Static: " + isStaticString + "\n" + methodTable.getTableInfo("\t\t");
    }
}
