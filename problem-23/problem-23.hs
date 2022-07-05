import Data.Function ((&))
import Data.Set (Set)
import qualified Data.Set as Set (fromList, notMember)

factors :: Int -> [Int]
factors n = [1 .. floor $ sqrt $ fromIntegral n]
    & map (\f -> let (q, r) = divMod n f in (f, q, r))
    & filter (\(_, _, r) -> r == 0)
    & map (\(f, q, _) -> (f, q))
    & unzip
    & (\(xs, ys) -> (xs, reverse ys))
    & uncurry glue
  where
    glue :: [Int] -> [Int] -> [Int]
    glue [x] (y : ys) = if x == y then y : ys else x : y : ys
    glue (x : xs) ys = x : glue xs ys

abundants :: [Int]
abundants = filter (\n -> (sum $ init $ factors n) > n) [1 .. 28123]

abundantSums :: Set Int
abundantSums = Set.fromList
    [ x + y
        | x <- abundants
        , y <- dropWhile (< x) abundants
    ]

main :: IO ()
main = print $ sum $ filter (`Set.notMember` abundantSums) [1 .. 28123]