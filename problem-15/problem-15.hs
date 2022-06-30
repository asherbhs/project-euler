factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

binomialCoefficient n k
    | k < 0     = undefined
    | k > n     = undefined
    | otherwise = div 
        (factorial n)
        (factorial k * factorial (n - k))

main :: IO ()
main = print $ binomialCoefficient 40 20