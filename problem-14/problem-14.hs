{-# LANGUAGE NumericUnderscores #-}

import Data.List (maximumBy)
import Data.Ord (comparing)

infixr 1 ?
(?) :: Bool -> a -> a -> a
(?) p x y = if p then x else y

collatz :: Int -> [Int]
collatz 1 = [1]
collatz n = n : collatz (even n ? div n 2 $ 3 * n + 1)

main :: IO ()
main = print 
    $ fst
    $ maximumBy (comparing snd) 
    $ map (\n -> (n, length $ collatz n)) [1 .. 1_000_000]