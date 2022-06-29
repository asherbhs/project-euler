{- 
note: this solution is inefficient, it checks all possible products of 3 digit
number. 

better would be to somehow check the product in decreasing order of size
and use find to only evaluate as many as are needed.
-}
main :: IO ()
main = print
    $ maximum
    $ filter (\n -> let s = show n in s == reverse s)
    $ map (*) [100 .. 999] <*> [100 .. 999]