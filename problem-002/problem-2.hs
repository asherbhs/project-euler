{-# LANGUAGE NumericUnderscores #-}

import Data.Function ((&))

iterate2 :: (a -> a -> a) -> a -> a -> [a]
iterate2 f x y = x : iterate2 f y (f x y)

main :: IO ()
main = print $
    fibonacci
        & takeWhile (<= 4_000_000)
        & filter even
        & sum
  where fibonacci = iterate2 (+) 1 2