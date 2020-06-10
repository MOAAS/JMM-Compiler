

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class SymbolTable {
    private HashMap<String, Symbol> symbolTable = new HashMap<>();
    private SimpleNode rootNode;
    private SymbolTable parentTable = null;
    private String className = null;

    private List<String> classesImported = new ArrayList<>();

    public SymbolTable(SimpleNode rootNode) {
        this.rootNode = rootNode;
    }

    public int getTableSize() {
        return symbolTable.size();
    }

    public String getRootNodeString() {
        return rootNode.toString();
    }

    public String getTableInfo(String spacing) {
        StringBuilder info = new StringBuilder(spacing + rootNode.toString() + " Table:\n");
        Iterator it = symbolTable.entrySet().iterator();
        while (it.hasNext()) {
            HashMap.Entry pair = (HashMap.Entry)it.next();
            info.append(spacing).append(pair.getKey()).append(" -> ").append( symbolTable.get(pair.getKey()).getInfo());
            //it.remove(); // avoids a ConcurrentModificationException
        }

        return info.toString();
    }

    public void addImportedClassName(String className) {
        if(!classesImported.contains(className)) classesImported.add(className);
    }

    public boolean checkClassImport(String className) { //Shouldn't be used to confirm extends
        if (className.equals(this.getClassName()))
            return true;
        if(classesImported.contains(className)) return true;
        else if(parentTable != null) return parentTable.checkClassImport(className);
        else return false;
    }

    public boolean checkConstructorImport(String signature) {
        if (this.parentTable != null)
            return this.parentTable.checkConstructorImport(signature);
        return this.getSymbol(signature) != null;
    }

    public Symbol put(String key, Symbol val) {
        return symbolTable.put(key, val);
    }

    public Symbol get(String key) { return symbolTable.get(key); }

    public boolean createTable(SymbolTable parentTable) {
        if (parentTable != null)
            this.className = parentTable.className;
        this.parentTable = parentTable;

        int increment = 1;
        if(rootNode instanceof ASTMainDeclaration) increment = 0;
        boolean success = true;
        Node[] children = rootNode.jjtGetChildren();
        for(int i = 0; i < children.length; i++) {
            SimpleNode node = (SimpleNode) children[i];
            if(!node.explore(symbolTable.size() + increment, this)) success = false;
        }

        return success;
    }

    public void setClassName(String className) {
        if (parentTable != null)
            parentTable.setClassName(className);
        this.className = className;
    }

    public String getClassName() {
        return this.className;
    }

    public String getParentClassName() {
        String className = this.getClassName();
        SymbolTable table = this;
        while (table != null) {
            Symbol symbol = this.getSymbol(className);
            if (symbol instanceof ClassSymbol)
                return ((ClassSymbol) symbol).getParentClass();
            table = table.parentTable;
        }
        return null;
    }

    public SimpleNode getRoot() {
        return rootNode;
    }

    public Symbol getSymbol(String name) {
        Symbol symbol = symbolTable.get(name);
        if (symbol != null)
            return symbol;
        if (parentTable == null)
            return null;
        // ** Cant use class attributes in main
        if (this.rootNode instanceof ASTMainDeclaration && parentTable.getSymbol(name) instanceof VarSymbol) {
            return parentTable.parentTable.getSymbol(name);
        }
        // **
        return parentTable.getSymbol(name);

       // return symbolTable.containsKey(name) ? symbolTable.get(name) : (parentTable == null ? null : parentTable.getSymbol(name));
    }

    public FunctionSymbol getFunctionSymbol(String className, String function){
        if (this.className.equals(className)) {
            Symbol symbol = this.getSymbol(function);
            if (symbol == null) {
                String extendedClass = this.getParentClassName();
                if (extendedClass == null || extendedClass.equals(className))
                    return null;
                return this.getFunctionSymbol(extendedClass, function);
            }
            return (FunctionSymbol) this.getSymbol(function);
        }
        else return (FunctionSymbol)this.getSymbol(className + "." + function);
    }

    public VarSymbol getVarSymbol(String name) {
        Symbol symbol = this.getSymbol(name);
        if (symbol instanceof VarSymbol)
            return (VarSymbol)symbol;
        return null;
    }

    public VarSymbol getLocalVarSymbol(String name) {
        return (VarSymbol)symbolTable.get(name);
    }

    public SymbolTable getParentTable() {
        return parentTable;
    }

    public boolean checkIfSymbolExists(String name) {
        return symbolTable.get(name) != null;
    }

    public int getMaxOrder() {
        int maxOrder = 0;

        for (Iterator<String> it = symbolTable.keySet().iterator(); it.hasNext(); ) {
            String next = it.next();
            Symbol symbol = symbolTable.get(next);
            if(symbol.getOrder() > maxOrder) maxOrder = symbol.getOrder();
        }

        return maxOrder;
    }
}
