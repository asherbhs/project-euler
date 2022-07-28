import Data.Map (Map)
import qualified Data.Map as Map
    ( empty
    , lookup
    , insert
    )
import Data.List (maximumBy)
import Data.Ord (comparing)

repeatingCycleLength :: Int -> Maybe Int
repeatingCycleLength n = h Map.empty $ zip [0 ..] $ tail $ busStop 1 n
  where
    busStop :: Int -> Int -> [(Int, Int)]
    busStop dividend divisor = 
        let
            (digit, remainder) = divMod dividend divisor
        in
            (digit, dividend) : busStop (10 * remainder) divisor

    h :: Map (Int, Int) Int -> [(Int, (Int, Int))] -> Maybe Int
    h _ ((_, (0, 0)) : xs) = Nothing
    h m ((i, (digit, dividend)) : xs) =
        case Map.lookup (digit, dividend) m of
            Just j  -> Just (i - j)
            Nothing -> h (Map.insert (digit, dividend) i m) xs

main :: IO ()
main = print $ maximumBy (comparing repeatingCycleLength) [1 .. 999]