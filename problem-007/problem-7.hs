{-# LANGUAGE NumericUnderscores #-}

primes :: [Int]
primes = seive [2 ..]
  where
    seive :: [Int] -> [Int]
    seive (x : xs) = x : seive (filter (\n -> mod n x /= 0) xs)

main :: IO ()
main = print $ primes !! 10_000