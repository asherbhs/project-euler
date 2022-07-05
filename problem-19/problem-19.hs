import Data.Time.Calendar 
    ( fromGregorian
    , toGregorian
    , dayOfWeek
    , DayOfWeek(..)
    )
import Data.Function ((&))

main :: IO ()
main = print 
    $ [fromGregorian 1901 1 1 .. fromGregorian 2000 12 31]
    & filter 
        (\date -> third (toGregorian date) == 1 && dayOfWeek date == Sunday)
    & length
  where
    third (_, _, z) = z