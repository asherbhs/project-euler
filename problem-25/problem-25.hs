import Data.Function ((&))
import Data.List (findIndex)
import Data.Maybe (fromJust)

iterate2 :: (a -> a -> a) -> a -> a -> [a]
iterate2 f x y = x : iterate2 f y (f x y)

main :: IO ()
main = print 
    $ (+ 1) 
    $ fromJust 
    $ findIndex ((== 1000) . length . show) fibonacci
  where
    fibonacci = iterate2 (+) 1 1