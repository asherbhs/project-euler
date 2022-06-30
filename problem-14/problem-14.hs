{-# LANGUAGE NumericUnderscores #-}

import Data.List (maximumBy)
import Data.Ord (comparing)

collatz :: Int -> [Int]
collatz 1 = [1]
collatz n = n : collatz (if even n then div n 2 else 3 * n + 1)

main :: IO ()
main = print $ maximumBy (comparing (length . collatz)) [1 .. 1_000_000]