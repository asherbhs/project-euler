from typing import Generator
from itertools import takewhile

def fibonacci(x: int, y: int) -> Generator[int, None, None]:
    yield(x)
    while True:
        (x, y) = (y, x + y)
        yield(x)

print(sum(
    filter(
        lambda n: n % 2 == 0,
        takewhile(
            lambda n: n <= 4_000_000,
            fibonacci(1, 2)
        )
    )
))
