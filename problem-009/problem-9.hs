import Data.List (find)
import Data.Function ((&))

main :: IO ()
main = print
    $ [ (a, b, c) 
        | a <- [1 .. 499]
        , b <- [a + 1 .. 499]
        , c <- [b + 1 .. 499]
        , a * a + b * b == c * c
    ]
    & find (\(a, b, c) -> a + b + c == 1000)
    & (\(Just (a, b, c)) -> a * b * c)