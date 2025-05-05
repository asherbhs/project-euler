import java.util.stream.IntStream;

public class Problem2 {
    public static void main(String[] args) {
        new Problem2().solve();
    }

    public void solve() {
        FibonacciGenerator f = new FibonacciGenerator();
        System.out.println(

            IntStream.generate(() -> f.nextFibonacci())
                .takeWhile(n -> n <= 4000000)
                .filter(n -> n % 2 == 0)
                .sum()

        );
    }

    private class FibonacciGenerator {
        private int fib1 = 1;
        private int fib2 = 2;

        public int nextFibonacci() {
            int hold = fib1;
            fib1 = fib2;
            fib2 = fib2 + hold;
            return hold;
        }
    }
}
