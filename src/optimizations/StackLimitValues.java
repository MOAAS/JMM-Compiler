public class StackLimitValues{
    public int maxStack = 0;
    public int totalStack = 0;

    public StackLimitValues(){}

    public StackLimitValues incStack(int num){
        this.totalStack += num;
        this.maxStack = Math.max(this.totalStack, this.maxStack);
        return this;
    }

    public StackLimitValues decStack(int value){
        this.incStack(-value);
        return this;
    }

    @Override
    public String toString(){
        return "Max stack: " + this.maxStack + " TotalStack: " + this.totalStack;
    }
}