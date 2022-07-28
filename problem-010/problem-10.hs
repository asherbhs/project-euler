{-# LANGUAGE NumericUnderscores #-}

primes :: [Integer]
primes = seive [2 ..]
  where
    seive :: [Integer] -> [Integer]
    seive (x : xs) = x : seive (filter (\n -> mod n x /= 0) xs)

main :: IO ()
main = print $ sum $ takeWhile (< 2_000_000) primes