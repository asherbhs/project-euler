package main

import "core:fmt"

digits :: proc(n: int) -> []int {
	n := n
	digits := new([10]int)
	i := 0
	for ; n > 0; i += 1 {
		digits[i] = n % 10
		n /= 10
	}
	return digits[0:i]
}

/*
let x, y be integers and |x|, |y| be their number of digits.
note that

	|x| + |y| - 1 ≤ |xy| ≤ |x| + |y|,

and

	|x| + |y| + |xy| = 10,

so

	2|x| + 2|y| - 1 ≤ 10 ≤ 2|x| + 2|y|,

meaning

	|x| + |y| = 5.

we also need only check |x| < |y|.
*/

main :: proc() {
	products := make(map[int]bool)
	x_loop: for x in 1..=99 {
		digits_x := digits(x)
		defer delete(digits_x)
		found_x: bit_set[1..=9] = {}
		for d in digits_x {
			if d == 0 || d in found_x { continue x_loop }
			found_x = found_x + {d}
		}
		min, max: int
		switch len(digits_x) {
		case 1: min, max = 1000, 9999
		case 2: min, max = 100,  999
		}
		y_loop: for y in min..=max {
			digits_y := digits(y)
			defer delete(digits_y)
			found := found_x
			for d in digits_y {
				if d == 0 || d in found { continue y_loop }
				found = found + {d}
			}
			xy := x * y
			digits_xy := digits(xy)
			defer delete(digits_xy)
			for d in digits_xy {
				if d == 0 || d in found { continue y_loop }
				found = found + {d}
			}
			for d in 1..=9 {
				if d not_in found { continue y_loop }
			}
			products[xy] = true
		}
	}
	sum := 0
	for xy, _ in products { sum += xy }
	fmt.println(sum)
}
