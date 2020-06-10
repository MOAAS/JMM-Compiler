

public class VarSymbol extends Symbol {
    private String varType;

    public VarSymbol(String varType, int orderN) {
        super(orderN);
        this.varType = varType;
    }

    public String getVarType() {
        return varType;
    }

    @Override
    public boolean createSymbolTable() {return true;}

    public String getInfo() {
        return super.getInfo() + " | Type: " + varType + "\n";
    }
}
