

public class VariableState {
    public String state;
    public SimpleNode value;

    public VariableState(String state, SimpleNode value) {
        this.state = state;
        this.value = value;
    }

    public String toString(){
        return  "      Value: " + value + "     State : " + state;
    }
}
