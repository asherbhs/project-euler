main :: IO ()
main = print
    $ sum 
    $ filter
        (\n -> mod n 3 == 0 || mod n 5 == 0) 
        [1 .. 999]