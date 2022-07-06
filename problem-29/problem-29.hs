import Data.Function ((&))
import Data.List (sort, group)

main :: IO ()
main = print 
    $ [ a ^ b | a <- [2 .. 100], b <- [2 .. 100] ]
    & sort
    & group
    & map head
    & length
