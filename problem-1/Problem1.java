import java.util.stream.IntStream;

public class Problem1 {
    public static void main(String[] args) {
        System.out.println(solution());
    }

    private static int solution() {
        return IntStream.range(1, 1000)
            .filter(n -> n % 3 == 0 || n % 5 == 0)
            .sum();
        // you can also just paste in the C version:

        // int sum = 0;
        // for (int i = 1; i < 1000; i++) {
        //     if (i % 3 == 0 || i % 5 == 0) sum += i;
        // }
        // return sum;
    }
}