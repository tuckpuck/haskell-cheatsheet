import Data.List

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

-- Ex. Result of sort is pipelined to reverse.
countdown :: [Int] -> [Int]
countdown x = (reverse . sort) x

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

-- * Pattern matching
-- Matching data (values, types, etc) against a pattern
-- Optionally you can bind variables to successful matches
-- You must provide pattern matches for all possible scenarios. 
-- Haskell matches from top to bottom, so the first definition will match the top one if it matches multiple. 
-- Pattern matching is straightforward to do different things depending on the structure or value of the arguments. Also makes it easy to extract certain values from tuples and lists. 

-- Catch-all patterns allow you to provide a default case if a provided param does not match anything else. 
-- If you don't care what the value will be, you can use _ as the catchall. 

-- Pattern matching strings
birthday :: Int -> [Char]
birthday 1 = "Welcome to the world"
birthday 18 = "You're an adult"
birthday 55 = "You're an adult fr fr"
birthday age = "Happy birthday, you are " ++ show age

-- Pattern matching lists
whatsInsideThisList:: [Int] -> String
whatsInsideThisList [] = "It's empty!"
whatsInsideThisList [x] = "A single element: " ++ show x
whatsInsideThisList [x, y] = "Two elements: " ++ show x ++ " and " ++ show y ++ "."
whatsInsideThisList (x:y:z:[]) = "The list has three elements: " ++ show [x, y, z]
whatsInsideThisList (x:rest) = "The first element is: " ++ show x ++ ", and the rest are " ++ show rest
list1=whatsInsideThisList [] -- "It's empty!"
list2=whatsInsideThisList [1, 2] -- "Two elements: 1 and 2"
list3=whatsInsideThisList [1, 2, 3] -- "The list has three elements: [1,2,3]"
list4=whatsInsideThisList [1, 2, 3, 4] -- "The first element is: 1, and there are qui

-- With lists, you can create a catchall using this syntax (_:_:c:_), the final _ means it doesn't matter what is after this or how many elements are after this.
getThirdFromList :: [Int] -> [Int]
getThirdFromList [] = [-1]
getThirdFromList [_] = [-1]
getThirdFromList [_,_] = [-1]
getThirdFromList [_,_,c] = [c]
getThirdFromList (_:_:c:_) = [c]

initials':: String -> String -> String
initials' (f:_) (l:_) = [f] ++ "." ++ [l] ++ "."
initials' _ _ = "How was your name again?"
getIntials = initials' "nikola" "tesla"

findLengthRecusively :: Num a => [a] -> a
findLengthRecusively [] = 0
findLengthRecusively (x:xs) = 1 + findLengthRecusively xs

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

-- Pattern matching Tuples
getSecondFromTuple :: (a,b,c) -> b
getSecondFromTuple (_,y,_) = y

changeTuple :: (a,b,c,d) -> (b,d)
changeTuple (_,x,_,y) = (x, y)

reverseTuple :: (x, y) -> (y, x)
reverseTuple (x, y) = (y, x)

fst :: (a, b) -> a
fst (a, _) = a

snd :: (a,b) -> b
snd (_, b) = b

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

-- * If then else syntax
-- if <condition>
--   then <expression1>
--   else <expression2>
-- If then else is an expression not a statement. 
-- "If" in haskell must also have "else" because every function must return a value. 

-- This example multiplies a number by 2 if that number is less than 100. 
doubleSmallNumber x = if x > 100 
                        then x 
                        else x * 2

-- To check for multiple conditions using if/then/else, you can use nested conditions. 
type Power = String
type Pokemon = String

choosepokemon_ifelse :: Power -> Pokemon
choosepokemon_ifelse  p =
  if p == "Grass"
  then "Bulbasaur"
  else
    if p == "Fire"
    then "Charmander"
    else
      if p == "Water"
      then "Squirtle"
      else "Pikachu"

-- * Case syntax
-- Execute a specific block of code based on a variable's value
-- case <Exp> of <Pattern1> -> <Result1>
--               <Pattern1> -> <Result1>
--               <Pattern1> -> <Result1>

-- The default value can use any word, like end in this case:
choosepokemon_case :: Power -> Pokemon
choosepokemon_case p = case p of
  "Grass" -> "Bulbasaur"
  "Fire" -> "Charmander"
  "Water" -> "Squirtle"
  end -> "pikachu"

checkForZeroes :: (Int, Int, Int) -> String
checkForZeroes tuple3 = case tuple3 of
                          (0, _, _) -> "The first one is a zero!"
                          (_, 0, _) -> "The second one is a zero!"
                          (_,_,0) -> "The third one is a zero"
                          _ -> "Please provide a tuple of"

-- You can do most of the same things using pattern matching, but case statements have the advantage they can be used anywhere an expression can: 
checkForZeros' :: (Int, Int, Int) -> String
checkForZeros' tuple3 = "The " ++ show tuple3 ++ " has " ++
    case tuple3 of
        (0, _, _) -> "a zero as its first element"
        (_, 0, _) -> "a zero as its second element"
        (_, _, 0) -> "a zero as its third element"
        _  -> "no zeroes!"
checkzeros = checkForZeros' (32,0,256)

-- * Guard syntax
-- Guards have similar to properties to if/else, but they are suited for when there are many conditions. 
-- You can create a catchall condition using otherwise. Otherwise is literally just True, which is another way to set up a catchall. You could also just put True instead of otherwise to set up a value. 

-- func arg
--   | <Condition1> = <Result1>
--   | <Condition2> = <Result2>
--   | <Cordition3> = <Result3>
--   | otherwise = <Result4>

choosepokemon_guard :: Power -> Pokemon
choosepokemon_guard p
  | p == "Grass" = "Bulbasaur"
  | p == "Fire" = "Charmander"
  | p == "Water" = "Sauirtle"
  | otherwise = "Pikachu"


birthdayCongrats :: Int -> String
birthdayCongrats age 
  | age == 1 = "Welcome to the world"
  | age > 1 && age < 35 = "Happy birthday young person"
  | age >= 35 && age < 200 = "Happy birthday"
  | otherwise = "unknown age"

-- * Let/in syntax
-- let expressions are convenient whenever we want to split complex expressions into smaller building blocks that you combine into a final expression.
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
                volume = Prelude.pi * diameter^2 * height / 4

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

