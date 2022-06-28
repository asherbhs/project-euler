fun solution(x: Int): Int 
    = (1 until x)
        .filter { it % 3 == 0 || it % 5 == 0 }
        .sum()

fun main() = println(solution(1000))