import java.util.HashSet;
import java.util.Set;

public class LiveNode {
    public String varName;
    public int colorIndex;
    public Set<LiveNode> edges;

    private boolean ignore = false;
    private LiveNode realNode = null;

    public LiveNode(String varName) {
        this.varName = varName;
        this.colorIndex = -1;
        edges = new HashSet<>();
    }

    public LiveNode(String varName, int colorIndex) {
        this.varName = varName;
        this.colorIndex = colorIndex;
        edges = new HashSet<>();
    }

    public LiveNode(LiveNode node) {
        this.varName = node.varName;
        this.colorIndex = node.colorIndex;
        edges = node.edges;
        ignore = true;
        realNode = node;
    }

    public void setColorIndex(int index) {
        colorIndex = index;
    }

    public void createEdge(LiveNode node) {
        if(node.ignore) node = node.realNode;

        if(this.equals(node)) return;

        edges.add(node);
        node.edges.add(this);
    }

    public LiveNode getRealNode() {
        if(ignore) return realNode;
        else return this;
    }

    @Override
    public boolean equals(Object obj) {
        if(ignore) return false;
        else return super.equals(obj);
    }
}