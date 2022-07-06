import Data.Function ((&))
import Data.Set (Set)
import qualified Data.Set as Set (fromList, member)
import Data.List (maximumBy)
import Data.Ord (comparing)

primes :: [Int]
primes = seive [2 ..]
  where
    seive :: [Int] -> [Int]
    seive (x : xs) = x : seive (filter (\n -> mod n x /= 0) xs)
    
primeSet :: Set Int
primeSet = Set.fromList $ take 1000 primes

consecutivePrimesForCoefficients :: Int -> Int -> Int
consecutivePrimesForCoefficients a b
    = [0 ..]
    & map (\n -> n * n + a * n + b)
    & takeWhile (`Set.member` primeSet)
    & length

main :: IO ()
main = print 
    $ [ (a, b) | a <- [-999 .. 999], b <- [-1000 .. 1000] ]
    & maximumBy (comparing (uncurry consecutivePrimesForCoefficients))
    & (\(a, b) -> a * b)