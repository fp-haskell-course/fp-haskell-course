
import Debug.Trace

facs :: [Integer]
facs = scanl1 update [ 1 .. ]

update :: Integer -> Integer -> Integer
update x y =
    let prod = x * y
    in trace ("\t" ++ show x ++ " * " ++ show y ++ " ->") prod

main :: IO ()
main = do
    print $ take 6 facs
    print $ take 6 facs
    print $ take 9 facs
