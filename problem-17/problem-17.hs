import Data.Char (digitToInt)

say :: Int -> String
say n
    | n < 0     = undefined
    | n > 1000  = undefined
    | otherwise = digitStringToWords $ show n
 where
    digitStringToWords s = case s of
        "0" -> ""
        "1" -> "one"
        "2" -> "two"
        "3" -> "three"
        "4" -> "four"
        "5" -> "five"
        "6" -> "six"
        "7" -> "seven"
        "8" -> "eight"
        "9" -> "nine"

        "10" -> "ten"
        "11" -> "eleven"
        "12" -> "twelve"
        "13" -> "thirteen"
        "14" -> "fourteen"
        "15" -> "fifteen"
        "16" -> "sixteen"
        "17" -> "seventeen"
        "18" -> "eighteen"
        "19" -> "nineteen"

        [t, u] -> 
            (case t of
                '0' -> ""
                '2' -> "twenty"
                '3' -> "thirty"
                '4' -> "forty"
                '5' -> "fifty"
                '6' -> "sixty"
                '7' -> "seventy"
                '8' -> "eighty"
                '9' -> "ninety"
            )
            ++ digitStringToWords [u]

        [h, '0', '0'] -> digitStringToWords [h] ++ "hundred"
        [h, t, u]     -> digitStringToWords [h] ++ "hundredand" ++ say (read [t, u])

        "1000" -> "onethousand"

main :: IO ()
main = print $ sum $ map (length . say) [1 .. 1000]