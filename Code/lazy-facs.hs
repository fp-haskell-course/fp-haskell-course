
import Debug.Trace

facs :: [Integer]
facs =
    1 : update 1 1
  where
    update n p =
        let next = n + 1
            prod = next * p
        in traceStatus next p (prod : update next prod)


traceStatus :: Integer -> Integer -> a -> a
traceStatus x y = trace ("\t" ++ show x ++ " * " ++ show y ++ " ->")


main :: IO ()
main = do
    print $ take 6 facs
    print $ take 6 facs
    print $ take 9 facs
