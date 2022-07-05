import Data.Function ((&), on)

factors :: Int -> [Int]
factors n = [1 .. floor $ sqrt $ fromIntegral n]
    & map (\f -> let (q, r) = divMod n f in (f, q, r))
    & filter (\(_, _, r) -> r == 0)
    & map (\(f, q, _) -> (f, q))
    & unzip
    & (\(xs, ys) -> (xs, reverse ys))
    & uncurry glue
  where
    glue [x] (y : ys) = if x == y then y : ys else x : y : ys
    glue (x : xs) ys = x : glue xs ys

areAmicable :: Int -> Int -> Bool
areAmicable x y =
    ((sum $ init $ factors x) == y) && ((sum $ init $ factors y) == x)

main :: IO ()
main = print $ sum $ concat
    [ [x, y] | x <- [1 .. 9999], y <- [x + 1 .. 9999], areAmicable x y ]