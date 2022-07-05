import Data.Function ((&))
import Data.List (sort)
import Data.Char (ord)

main :: IO ()
main = do
    file <- readFile "p022_names.txt"
    print $ "[" ++ file ++ "]"
        & read
        & sort
        & zip [1 ..]
        & map (\(i, s) -> i * alphabetValue s)
        & sum
  where
    alphabetValue :: String -> Int
    alphabetValue = sum . map (\c -> ord c - ord 'A' + 1)