import Data.List
import Data.Char

-- * Functions
-- Functions are the building block of a program. Everything that happens in Haskell is based on functions composed together
-- Parenthesis are used to prioritize operations. Without parenthesis, operations take place in the order of the precedence (PEMDAS).
-- Functions have the highest precedence of all operations in Haskell.

-- * Function syntax
-- Parameters are separated with spaces, both when defining and calling the function
-- Everything after = is the function body
-- First letter of a function's name has to be lowercase
addNums :: Int -> Int -> Int
addNums x y = x + y

-- * Definitions, Names, or Identifiers (AKA variables in other languages)
-- Definitions are technically functions that don't take any parameters and return just a specific piece of data. 
-- They are like variables in other languages.
-- You can supply a type signature to ensure that the provided data is the expected type. 
-- They are immutable and can't be changed. Because of this they are called identifiers, names, or definitions rather than variables. Setting one is called binding instead of assigning.
-- If defining a variable in ghci, use let before (ex let a = 1).
-- Below is an example of setting a definition for 'name' and setting it to the String type. Now "Bob" and the variable name are essentially interchangeable. 
name :: String
name = "Bob"

myName :: [Char]
myName = "Tucker Triggs" 

pi :: Double
pi = 3.14159265358979323846264

-- * Prefix and infix notation
-- There are two ways to call haskell functions, prefix and infix

-- Prefix
-- Prefix is the typical way, by writing the function name then its parameters
-- prod' x y = x * y
-- prod' 10 3

-- Infix
-- With infix the name of the function comes in between the parameters. 
-- Infix functions are called operators. Mathematical operators, comparisons, logic, and some list operators are examples of infix functions:
-- 3 + 5 
-- 3 > 5
-- True && False
-- 'h':['e','l','l','o']

-- You can use a prefix function as an infix function by adding backticks `` around the prefix function
-- a `infixFunc` b

-- You can use an infix function as a prefix function by adding parenthesis around it.
-- three = (+) 1 2

-- * Expressions vs statements
-- Expressions evaluate to values, whereas statements perform instructions. Everything in Haskell is an expression, nothing is a statement

-- * Function composition
-- Function composition is passing the output of one function as an input of another function.
-- . is the function composition operator
compo = (^2) . (*3) . (+4) $ 7 --same as (^2) ((*) 3 ((+) 4 7))

-- Ex. Result of sort is pipelined to reverse.
countdown :: [Int] -> [Int]
countdown x = (reverse . sort) x

-- * Application operator
-- $ takes a function and a value and produces the result of the application of the function to the value
-- Lowest priority among operators


-- * Function variations with apostrophe suffix
-- The suffixing of a an apostrophe ' means one of three things:
-- 1. a strict version. ex. foldl' is the strict version of foldl
-- 2. a slightly modified version of a function with a similar name
-- 3. a helper definition for the purpose of defining the function
-- 4. a safe version

beginsWithVowel :: String -> Bool
beginsWithVowel s 
  | head s == 'a' = True
  | head s == 'e' = True
  | head s == 'i' = True
  | head s == 'o' = True
  | head s == 'u' = True
  | head s == 'A' = True
  | head s == 'E' = True
  | head s == 'I' = True
  | head s == 'O' = True
  | head s == 'U' = True
  | otherwise = False 

beginsWithVowel' :: String -> Bool
beginsWithVowel' s  = elem (head s) "AEIOUaeiou"

-- * Safe functions
-- Often best practice is often to create a safe version of a function
-- A safe function will handle all cases without breaking program
-- For example, the native head function does not handle an empty list [] as an input and throw an exception. You can make a safe version that handles this case. 
safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (_:xs) = Just xs

getLast :: [a] -> Maybe a
getLast [] = Nothing
getLast [x] = Just x
getLast (x:xs) = Just (last xs)

-- * Currying
-- Currying is named after Haskell Curry. He came up with a way for a function taking multiple arguments to be transformed into a sequence of functions, each taking a single argument. 
-- Currying is necessary because Haskell uses Lambda calculus. In lambda calculus, functions can only have one input. Similarly in Haskell, every function only has one input and output. 

-- In this example, the parenthesis are used to separate the input from the function that it is being passed into. 
power :: Int -> (Int -> Int)
power x y = x ^ y

-- How currying works within a function
-- curringEx (Int Int Int) (Int)
-- (Int Int) (Int)
-- (Int) (Int)

answerToEverything = 42
complexCalc :: Integer -> Integer -> Integer -> Integer
complexCalc x y z = x * y * z * answerToEverything
-- Due to currying, what this really means is 
-- complexCalc :: Integer -> (Integer -> (Integer -> Integer))
-- complexCalc 10 20 30 is really ((complexCalc 10) 20) 30

-- * Let/in syntax
-- let expressions are convenient whenever we want to split complex expressions into smaller building blocks that you combine into a final expression.
-- Useful for keeping variables local to the function so they are not available to other functions.
-- Expression introduced in a 'let' expression exist only within that let expression.

-- 'Let' is used to create variables or expressions that remain local to that function
-- 'In' is where the expression is defined that uses the local variables

-- func arg =
--      let <BIND 1>
--          <BIND 2>
--      in <EXPR that uses BIND 1 and/or BIND 2>

doCalc :: Int -> Int
doCalc x = 
    let y = 100
        z = 2555
    in x * y *  z

-- "let" as an expression
isEven :: Int -> Bool
isEven x = 
  let remainder = x `mod` 2
  in remainder == 0

-- let can help simplify complex expressions
houseV side roofH = let cubeV = side ^ 3
                        pyramidV = (side ^ 2) * roofH / 3
                    in cubeV + pyramidV

-- Let can be used inline
inlineLet = let s1=10; s2=20; s3=30; in s1*s2*s3

-- Rebinding variables with let
-- Compute the area of a rectangle using local variables
rectangleArea :: Double -> Double -> Double
rectangleArea width height = let w = width
                                 h = height
                             in w * h

initials :: String -> String -> String
initials first last = 
    let firstInit = head first
        secondInit = head last
  in [firstInit] ++ "." ++ [secondInit] ++ "."


-- * Where syntax
-- Where is similar to let/in, except that the function is provided first, then variables and functions are bound with 'where'
-- Where expressions are convenient whenever we want to scope bindings over several guarded equations (not possible with let)
-- Where implies that everything after the where will be within that scope. 
-- Expressions defined with where are not accessible outside that function body.

-- func arg = <EXP that uses BINDI 1 and/or BIND 2>
--      where <BIND 1>
--            <BIND 2>

-- Compute the square of a number
square :: Int -> Int
square x = squared
  where squared = x * x

-- Calculate BMI given weight in kilograms and height in meters
calculateBMI :: Double -> Double -> Double
calculateBMI weight height = bmi
  where bmi = weight / (height * height)

-- Check if a year is a leap year
isLeapYear :: Int -> Bool
isLeapYear year = isDivisibleBy 4 && (not (isDivisibleBy 100) || isDivisibleBy 400)
  where
    isDivisibleBy n = year `mod` n == 0

-- Scope bindings over several different guard conditions
analyzeCylinder :: Float -> Float -> String
analyzeCylinder diameter height
                | volume < 10 = "The cylinder is a glass."
                | volume < 100 = "The cylinder is a bucket."
                | volume < 1000 = "The cylinder is a tank."
                | otherwise = "What in the world is that huge thing?!"
              where
                volume = Prelude.pi * diameter^2 * height / 4

-- * Higher order functions
-- Higher-order functions are functions that take other functions as arguments or return functions as results.
-- Functions are considered first-class citizens, which means they can be treated just like any other value or data type.
-- f :: Int -> (Int -> Char) is an example of currying, which happens every time there are multiple parameters.
-- f :: (Int -> Char) -> Char is an example of a function that takes a function as input.
-- When you see the type definition like (Int -> Int) -> Int it means it is expecting a function to be passed in. 
-- For example, we can create a 'square' function to calculate squares, then use that function within a new function squares that calculates a the squares of items in a list.
square' :: Int -> Int
square' x = x * x

squares :: [Int] -> [Int]
squares lst = Data.List.map square' lst

hof :: (Int -> Char) -> Int -> Char 
hof f n = f n 
-- You'll have to import Data.Char to access this chr function. 'chr' function converts an integer code point into a character.
showHof = hof chr 99

startWithCapital :: [Char] -> [Char]
startWithCapital (x:xs) = toUpper x : xs

applyFunctionTwice :: (a -> a) -> a -> a
applyFunctionTwice f x = f (f x)

twice1 = applyFunctionTwice (^2) 3
twice2 = applyFunctionTwice Data.List.reverse "hello"

-- Map is a classic example of a higher order function
-- It is a native function that takes a function that is applied to all elements
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

map = map' (+10) [12,34,65]
map2 = map' Data.Char.toUpper "Hello"
map3 = map' not [True, False, False]

-- * More function examples
plus = (+2) 3
times = (3 *) 4
comp=(4>)5
words1 = ("hello" ++ ) ", world"
words2 = (++ "hello") ", world"
division = (/ 2) 7
(xs) = [1,2]
add' = \x y -> x + y
(x', y' : ys', z') = (23, "world", 'x')

addInt :: (Int,Int) -> Int
addInt (a,b) = a + b

doubleSmallNumberIfLessThan100 :: Int -> Int
doubleSmallNumberIfLessThan100 x = if x < 100 then x*2 else x

myEqual :: Eq a => a -> a -> Bool
myEqual first second = first == second 

divideBy :: Int -> Int -> Int
divideBy a b = a `div` b

performOp :: (Int -> Int) -> Int -> Int -> Int
performOp f x y = y * (f x)

doubleMe x = x + x
doubleTen = doubleMe 10
-- Takes two numbers, multiplies them by 2, and adds them together
doubleUs x y = x * 2 + y * 2
doubleTenTen = doubleUs 10 10 
-- Functions that you define can also call each other. The above function could be redefined as:
doubleUsAgain x y = doubleMe x + doubleMe y

-- Convert fahrenheit to celsius. 
fToC x = (x - 32) * 5 / 9

-- Calculate volume of cylinder
volumeOfACylinder r h = Prelude.pi * r ^ 2 * h 

beginsWith :: Char -> String -> Bool
beginsWith _ [] = False
beginsWith c (x:xs)   = c == x

