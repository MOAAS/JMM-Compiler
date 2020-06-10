public abstract class Symbol{
    private int orderN;

    protected Symbol(int orderN) {
        this.orderN = orderN;
    }

    public int getOrder() {
        return orderN;
    }

    public void setOrder(int order) { this.orderN = order; }

    public abstract boolean createSymbolTable();

    public String getInfo() {
        if(orderN == -1) return "";
        else return "Order: " + orderN;
    }
}
