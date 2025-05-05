package main

import "core:fmt"
import "core:math"

main :: proc() {
	answer: u64 = 0
	for n in 1..=1000 {
		m: u64 = 1
		for _ in 1..=n {
			m *= u64(n)
			m %= 10000000000
		}
		answer += m
		answer %= 10000000000
	}
	fmt.println(answer)
}
