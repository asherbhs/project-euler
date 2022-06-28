import Data.Function ((&))

iterate2 :: (a -> a -> a) -> a -> a -> [a]
iterate2 f x y = x : iterate2 f y (f x y)

solution :: Integer
solution = fibonacci
    & takeWhile (<= 4000000)
    & filter even
    & sum
  where fibonacci = iterate2 (+) 1 2

main :: IO ()
main = print solution