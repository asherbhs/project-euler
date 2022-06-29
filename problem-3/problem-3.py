# this works but for the large number you reach the recursion limit
# python is just not made for super funtional recursive stuff :(

# from typing import Generator

# def nats(n: int) -> Generator[int, None, None]:
#     yield n
#     yield from nats(n + 1)

# def seive(ns: Generator[int, None, None]) -> Generator[int, None, None]:
#     p: int = next(ns)
#     yield p
#     yield from seive(filter(
#         lambda x: x % p != 0,
#         ns
#     ))

# def primes() -> Generator[int, None, None]: return seive(nats(2))

# def prime_factors(n: int) -> list[int]:
#     if n <= 1: 
#         return []

#     p: int = next(x for x in primes() if n % x == 0)
#     ps: list[int] = prime_factors(n / p)
#     ps.insert(0, p)
#     return ps

# print(prime_factors(600851475143)[-1])