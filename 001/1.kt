fun main() = println(
    (1 until 1000)
        .filter { it % 3 == 0 || it % 5 == 0 }
        .sum()
)