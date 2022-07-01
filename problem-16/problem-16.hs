import Data.Function ((&))
import Data.Char (digitToInt)

main :: IO ()
main = print
    $ (2 :: Integer) ^ 1000
    & show
    & map digitToInt
    & sum