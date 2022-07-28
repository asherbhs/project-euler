differences :: [Int]
differences = concat $ map (replicate 4) [2, 4 .. 1000]

main :: IO ()
main = print $ sum $ scanl (+) 1 differences