import Data.Maybe (fromJust)
import Data.List (find)

primes :: [Int]
primes = seive [2 ..]
  where
    seive (x : xs) = x : seive (filter (\n -> mod n x /= 0) xs)

primeFactors :: Int -> [Int]
primeFactors n
    | n <= 1 = []
    | otherwise = fromJust (
            do
                p <- find (\x -> mod n x == 0) primes
                return $ p : primeFactors (div n p)
        )

main :: IO ()
main = print $ maximum $ primeFactors 600851475143