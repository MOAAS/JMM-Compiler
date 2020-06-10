public class FunctionSymbol extends Symbol {
    protected final String returnType;
    protected final boolean isStatic;

    public FunctionSymbol(String returnType, boolean isStatic, int orderN) {
        super(orderN);
        this.returnType = returnType;
        this.isStatic = isStatic;
    }

    public String getReturnType() {
        return returnType;
    }

    public boolean isStatic() {
        return isStatic;
    }

    @Override
    public boolean createSymbolTable() {
        return true;
    }
}