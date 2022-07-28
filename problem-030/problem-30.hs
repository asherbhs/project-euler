import Data.Char (digitToInt)
import Data.Function ((&))

main :: IO ()
main = print
    $ [2 .. 999999]
    & filter (\x -> (sum $ map ((^5) . digitToInt) $ show x) == x)
    & sum