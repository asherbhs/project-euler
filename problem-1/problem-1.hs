solution :: Integer -> Integer
solution x 
    = sum 
    $ filter 
        (\n -> mod n 3 == 0 || mod n 5 == 0) 
        [1 .. x - 1]

main = print $ solution 1000