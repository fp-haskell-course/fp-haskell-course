{-# LANGUAGE ScopedTypeVariables #-}

import Test.Hspec
import Test.Hspec.QuickCheck

-- Hspec documentation : http://hspec.github.io/

main :: IO ()
main = hspec $
    describe "Data.List" $ do
        it "Can append to lists." $
            [1, 2] ++ [3, 4] `shouldBe` ([1, 2, 3, 4] :: [Int])
        it "Error for Head of an empty list." $
            head [] `shouldThrow` errorCall "Prelude.head: empty list"
        prop "QuickCheck list reverse." $ \ (list :: [Int]) ->
            let tisl = reverse list
            in reverse tisl == list

{-
brokenReverse :: [a] -> [a]
brokenReverse xs
    | length xs > 5 && any (== 42) xs = xs
    | otherwise = reverse xs

-}

