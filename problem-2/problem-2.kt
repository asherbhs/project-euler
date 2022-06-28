fun generateFibonacci(x: Int, y: Int): Sequence<Int> = sequence {
    yield(x)
    yieldAll(generateFibonacci(y, x + y))
}

fun main() = println(

    generateFibonacci(1, 2)
        .takeWhile { it <= 4_000_000 }
        .filter { it % 2 == 0 }
        .sum()

)