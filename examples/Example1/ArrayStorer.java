import java.util.Arrays;

class ArrayStorer {
    private int[] array;


    public ArrayStorer(int[] array) {
        this(array, 0);
    }

    public ArrayStorer(int[] array, int content) {
        this.array = array.clone();
        Arrays.fill(this.array, content);
    }

    public int sum() {
        int sum = 0;
        for (int num : array) {
            sum = sum + num;
        }
        return sum;
    }

    public int product() {
        int product = 1;
        for (int num : array) {
            product = product * num;
        }
        return product;
    }

    public int count() {
        return array.length;
    }

    public int[] getArray() {
        return array;
    }

    public void print() {
        for (int num : array) {
            System.out.print(num + " ");
        }
        System.out.println();
    }
}