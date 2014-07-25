% Lesson 1 - Introduction to FP, Types and Haskell

# Introduction

* This course is about typed, data generic functional
programming. It is not about "programming in Haskell"
because we all know "you can write FORTRAN in any
language".

* This course is about typed, data generic functional programming. It is not
about "programming in Haskell" because we all know "you can write FORTRAN in
any language".

* Typed : Using types to restrict the number of ways your program can go wrong.
* Data Generic : Use the power of types to write code that works over differnent
types and structures but which the compiler checks for sanity.
* Functional programing: programming with pure functions (eg sin/exp/log are
functions, but write_data_to_disk is not pure) rather than with variables/objects
with mutable state.

* Don't fear the jargon. You'll learn about lambdas, functors, moands and
applicatives in due course.

# Setting up your platform

* Setup (ghc, platform, cabal, hlint, hoogle etc)
* Direct them to hackage.haskell.org and hoogle.

# Hello world

```haskell
main :: IO ()
main = putStrLn "Hello World!"
```

## Exercises:
* Use runghc to execute Hello.hs
* Load the module into ghci, try running main.
* Use ghc to compile to an executable, look at the exe size and at the libraries it links.

# Compiler setup

* "-Wall -fwarn-tabs" is good. Try this bash alias:

```bash
alias hsrun='runghc -Wall -fwarn-tabs '
```

Now use hsrun instead of runghc.

* Otherwise, stick this in your .cabal files:

```
  ghc-options:       -Wall
                     -Wwarn
                     -fwarn-tabs
```


# GHCi

GHCi is GHC's interactive environment, in which Haskell expressions can be
interactively evaluated and programs can be interpreted.

We can set options in $(HOME)/.ghci, here are some
recommended ones:

```
:set -Wall -fwarn-tabs -fno-warn-type-defaults
:set -XOverloadedStrings -XNoMonomorphismRestriction
:set prompt "ghci> "
```

These settings won't make much sense yet, but they are
documented in the GHC user guide at
https://www.haskell.org/ghc/docs/latest/html/users_guide/

* -Wxxx is to enable a warning. 
* -fxxx turns on a feature
* -X turns on a GHC extension which is not part of standard Haskell.

# Haskell syntax

* Structure of a Haskell source file:
* Take a look at Syntax/main.hs
* Language pragmas
* Module definition (exports)
* Imports, including restricted, qualified, qualified as, hiding
* Comments, -- and {--
* Type annotations
* Function definitions
* data declarations
* newtype declerations
* type declarations

# Explain types

  Load ghci and go through operations on disparate types, e.g .1 + True
  Type inference
  ad-hoc (c++) vs parametric 

--------------------------------------------------------------------------------
ADTs
----
ADTs
  product types (basic record syntax)
  sum types, either then maybe
  algebra of these
  data constructors
  pattern matching

* ADT

data Expr
	= IntV Integer
	| Plus Expr Expr
	| Times Expr Expr

TODO: Exercise: Calculator interpreter


# Lists

* Look at the definition of Data.List.
* Note that List can hold any type, but can only hold a single type (workarounds later).
* look at the type of the map function
* doing things like:

     map show [1,2,3,4]
     map (+1) [1,2,3,4]

# Tests

* Look at a simple test program using Hspec (hello-hspec.hs), mentioning that
  'do' is to be ignored for now, we will talk about monads later.

```haskell
    {-# LANGUAGE ScopedTypeVariables #-}

    import Test.Hspec
    import Test.Hspec.QuickCheck

    -- Hspec documentation : http://hspec.github.io/

    main :: IO ()
    main = hspec $
        describe "Data.List" $ do
            it "Can append to lists." $
                [1, 2] ++ [3, 4] `shouldBe` ([1, 2, 3, 4] :: [Int])
            prop "QuickCheck list reverse." $ \ (list :: [Int]) ->
		reverse (reverse list) == list
            it "Error for Head of an empty list." $
                head [] `shouldThrow` errorCall "Prelude.head: empty list"
```

# Parametricity

* Now add the following function to the above file and replace one of the calls
  to reverse with brokenReverse, but don't run it yet.

    brokenReverse :: [a] -> [a]
    brokenReverse xs
        | any (== 13) xs = xs
        | otherwise = reverse xs

  What does this function do? Try looking at the type of the any function in
  ghci or look it up on hoogle.
  Explain what brokenReverse does without running it. Then try to compile it
  and see that the compiler says. Explain that this is how the Haskell compiler
  makes sense of the stuff we write and call us out on our bullshit/
  fuzzy-thinking.
  Fix the function and then see if QuickCheck can find the error in the
  brokenReverse function.

# Lazyness

Explain lazy evaluation and call by need. We'll talk much more about this
later. Think about how you would have to write that copyFile function in
other languages.

# Lazyness example one, facs

stuff about numbers

# Lazyness example two, IO

* A simple copy file program:

```haskell
    import System.Environment

    import qualified Data.ByteString.Lazy as LBS

    main :: IO ()
    main = do
        args <- getArgs
        case args of
            [infile, outfile] -> copyFile infile outfile
            _ -> putStrLn "Usage message here"

    copyFile :: FilePath -> FilePath -> IO ()
    copyFile infile outfile = do
        text <- LBS.readFile infile
        LBS.writeFile outfile text
```

  run it using:

```
	hsrun copy-file.hs really-huge-file /dev/null
```

And run top in another window and show that memory usage is less that the size
of the file (ie 8Gig ISO file or something). Try compiling a binary and
running that binary under strace. Look at the interleaved read and write
system calls.


* Do some exercises?

TODO: map

TODO: filter

