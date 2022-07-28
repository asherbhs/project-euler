use std::iter;

fn main() {
	let mut fib1: i32 = 1;
	let mut fib2: i32 = 2;
	let fibs = iter::repeat_with(|| {
		let hold = fib1;
		fib1 = fib2;
		fib2 += hold;

		hold
	});

	println!("{}",
		fibs
			.take_while(|&n| n < 4_000_000)
			.filter(|&n| n % 2 == 0)
			.sum::<i32>()
	);
}