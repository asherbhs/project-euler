package main

import "core:fmt"

main :: proc() {
	fact := [10]int{
		1,
		1,
		1 * 2,
		1 * 2 * 3,
		1 * 2 * 3 * 4,
		1 * 2 * 3 * 4 * 5,
		1 * 2 * 3 * 4 * 5 * 6,
		1 * 2 * 3 * 4 * 5 * 6 * 7,
		1 * 2 * 3 * 4 * 5 * 6 * 7 * 8,
		1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9,
	}
	answer := 0
	// (7×!9)<9999999 and (!9)<10*7 so sums of factorials of digits can't catch up after this point
	for n := 3; n < 9999999; n += 1 {
		m := n
		sum := 0
		for m > 0 {
			sum += fact[m % 10]
			m /= 10
		}
		if sum == n { answer += sum }
	}
	fmt.println(answer)
}
