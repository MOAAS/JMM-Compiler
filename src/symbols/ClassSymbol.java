public class ClassSymbol extends Symbol {
    private final SymbolTable classTable;
    private final SymbolTable globalTable;
    private final String parentClass;

    public ClassSymbol(SymbolTable globalTable, String parentClass, SimpleNode classRoot, int orderN) {
        super(orderN);
        classTable = new SymbolTable(classRoot);
        this.globalTable = globalTable;
        this.parentClass = parentClass;
    }

    public boolean createSymbolTable() {
        return classTable.createTable(globalTable);
    }

    public String getInfo() {
        String info = super.getInfo();
        if(!parentClass.equals("")) info += " | Extends: " + parentClass;
        return info + "\n" + classTable.getTableInfo("\t");
    }

    public String getParentClass() {
        return parentClass;
    }
}