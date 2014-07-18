-- This is a commemnt, starting with '--' and runninh to the end of the line.

{-
    This is also comment, but multi-line and terminated by enclosing
-}

{-# LANGUAGE OverloadedStrings #-}

-- Define the name of this module.
-- Module name must mutch the file name (HaskellSyntax.hs in this case).
-- May be hierachical, A.B.C so that the file would be A/B/C.hs.
module HaskellSyntax
    -- Module exports
    ( ADT (..)
    , Struct                -- Export struct without access to the constructor.


    , addInt
    , addFive

    , mkStruct
    , mkStructPointFree
    ) where

-- Import S
import Wibble.Five


-- Data type and function definitions can be placed in any order. Functions
-- earlier in the file can call functions later in the file and the compiler
-- will figure it out.


-- A function named 'addInt' which takes two Ints and returns the sum.
-- The first line is the type signature with '::' being pronounced 'has type'.
-- The second line is the implementation of this trivial function.
addInt :: Int -> Int -> Int
addInt x y = x + y

-- A new function 'addFive' that is built by partially applying 'addInt'.
-- Partial application means suppying less that the required number of
-- arguments.
addFive :: Int -> Int
addFive = addInt five

-- A Struct
data Struct = Constructor Int Int String


mkStruct :: Int -> Int -> String -> Struct
mkStruct a b s = Constructor a b s

mkStructPointFree :: Int -> Int -> String -> Struct
mkStructPointFree = Constructor


-- Algebraic Data Type.
-- This ADT has three distinct contructors, Ctor1, Ctor2 and Ctor3.
data ADT
    = Ctor1
    | Ctor2 String
    | Ctor3 Int String



