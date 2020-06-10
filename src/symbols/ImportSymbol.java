public class ImportSymbol extends FunctionSymbol {

    public ImportSymbol(String returnType, boolean isStatic, int orderN) {
        super(returnType,isStatic,orderN);
    }

    @Override
    public boolean createSymbolTable() {return true;}

    public String getInfo() {
        String isStaticString = isStatic ? "true" : "false";
        return super.getInfo() + " | Returns: " + returnType + " | Static: " + isStaticString + "\n";
    }
}
