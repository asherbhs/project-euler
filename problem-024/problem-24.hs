{-# LANGUAGE NumericUnderscores #-}

import Data.List (sort, delete)

lexicographicPermutations :: (Eq a, Ord a) => [a] -> [[a]]
lexicographicPermutations = h . sort
  where
    h :: (Eq a, Ord a) => [a] -> [[a]]
    h [] = [[]]
    h xs = concat $ map (\x -> map (x :) (h $ delete x xs)) xs

main :: IO ()
main = putStrLn $ lexicographicPermutations ['0' .. '9'] !! 999_999