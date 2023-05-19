import Data.List

-- * Functions
-- Everything that happens in Haskell is based on functions composed together
-- Parameters are separated with spaces, both when defining and calling the function
-- Everything after = is the function body
-- First letter of a function's name has to be lowercase
-- Parenthesis are used to prioritize calculations
-- Operations take place in the order of the precedence(PEMDAS).
-- Functions have the highest precedence of all operations in Haskell.
addNums :: Int -> Int -> Int
addNums x y = x + y 

-- * Definitions, Names, or Identifiers (aka Variables)
-- Definitions are functions that don't take any parameters and return just a specific piece of data. 
-- They are like variables in other languages, but are technically functions.
-- You can supply a type signature to ensure that the provided data is the expected type. 
-- They are immutable and can't be changed. Because of this they are called identifiers, names, or definitions rather than variables. Setting one is called binding instead of assigning.
-- If defining a variable in ghci, use let before (ex let a = 1).
-- Below is an example of setting a definition for 'name' and setting it to the String type. Now "Bob" and the variable name are essentially interchangeable. 
name :: String
name = "Bob"

myName :: [Char]
myName = "Tucker Triggs" 

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

-- Ex. Result of sort is pipelined to reverse.
countdown :: [Int] -> [Int]
countdown x = (reverse . sort) x

-- * Patterns 
-- Patterns allow us to destructure values and capture variables
-- Patterns can be applied to tuples
reverseTuple :: (x, y) -> (y, x)
reverseTuple (x, y) = (y, x)

fst :: (a, b) -> a
fst (a, _) = a

snd :: (a,b) -> b
snd (_, b) = b

-- Patterns can be applied to lists
isSame = [1,2,3,4] == 1 : (2 : (3 : (4 :[])))
-- Lists are constructed by the : operator, and are decomposed by head and tail functions

isSame2 = 2 : (3 : (4 : (5 : (6 : (7 : []))))) == [2,3,4,5,6,7]
checkHead = head (2 : (3 : (4 : (5 : (6 : (7 : []))))))
checkTail = tail (2 : (3 : (4 : (5 : (6 : (7 : []))))))

-- Common pattern to deconstruct Int or Char lists
splitIntList :: [a] -> [a]
splitIntList [] = []
splitIntList (y:ys) = ys

splitCharList :: [a] -> [a]
splitCharList [] = []
splitCharList (y:ys) = ys

-- Can be used to get certain items out of a list
getHead :: [a] -> a
getHead (x:xs) = x

getTail :: [a] -> [a]
getTail (y:ys) = ys

getFirstFromCharList = getHead ['w','o','r','l','d']
getTailFromCharList = getTail ['w','o','r','l','d']
getFirstFromIntList =  getHead [2,3,4,5]
getTailFromIntList = getTail [2,3,4,5]

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

-- * Function variations with apostrophe suffix
-- The suffixing of a an apostrophe ' means one of three things:
-- 1. a strict version
-- 2. a slightly modified version of a function with a similar name
-- 3. a helper definition for the purpose of defining the function
-- ex. foldl' is the strict version of foldl

-- * Pattern matching
findLength :: Num a => [a] -> a
findLength [] = 0
findLength (x:xs) = 1 + findLength xs

second :: (a,b,c) -> b
second (_,y,_) = y

-- * Currying
-- All functions with multiple arguments are actually currying

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

-- * If then syntax
-- "If" in haskell must also have "else" because every function must return a value.
-- if <condition>
--   then <expression1>
--   else <expression2>

-- This example multiplies a number by 2 if that number is less than 100. 
doubleSmallNumber x = if x > 100 
                        then x 
                        else x * 2

-- * Guard syntax
-- Guards have similar to properties to if/else, but they are suited for when there are many conditions. 
-- You can create a catchall condition using otherwise. Otherwise is actually just True, which is another way to set up a catchall. 


-- func arg
--   | <Condition1> = <Result1>
--   | <Condition2> = <Result2>
--   | <Cordition3> = <Result3>
--   | otherwise = <Result4>

birthdayCongrats :: Int -> String
birthdayCongrats age 
  | age == 1 = "Welcome to the world"
  | age > 1 && age < 35 = "Happy birthday young person"
  | age >= 35 && age < 200 = "Happy birthday"
  | otherwise = "unknown age"

-- * Let/in syntax
-- let expressions are convenient whenever we want to split complex expressions
-- into smaller building blocks that you combine into a final expression.
-- Expression introduced in a let expression exist only within that let expression.

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
-- where expressions are convenient whenever we want to scope bindings over several guarded equations (not possible with let)
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
                volume = pi * diameter^2 * height / 4


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

removeSpaces :: String -> String
removeSpaces = filter (\x -> x /= ' ')

getFrequency = map (\x -> (head x, length x))

doubleSmallNumberIfLessThan100 :: Int -> Int
doubleSmallNumberIfLessThan100 x = if x < 100 then x*2 else x

mapString :: Char -> [Char] -> [Bool]
mapString c x = (filter (==True) (map (>=c) x)) ++ filter (==False) (map (>=c) x)

myEqual :: Eq a => a -> a -> Bool
myEqual first second = first == second 

divideBy :: Int -> Int -> Int
divideBy a b = a `div` b

performOp :: (Int -> Int) -> Int -> Int -> Int
performOp f x y = y * (f x)

beginsWith :: Char -> String -> Bool
beginsWith _ [] = False
beginsWith c (x:xs)   = c == x

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
volumeOfACylinder r h = pi * r ^ 2 * h 

