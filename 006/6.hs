main :: IO ()
main = print 
    $ (square $ sum        [1 .. 100])
    - (sum    $ map square [1 .. 100])
  where
    square = (^2)