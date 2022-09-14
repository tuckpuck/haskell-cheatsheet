-- * Type Info
-- Types are like a label that is attached to data in an expression and limits what that data can do. To attach them, use :: operator
-- The :: operator is read as "has type of" and denotes a type signature. 
-- The type of any expression, value, or function can be explicitly stated
-- Types of variables and functions are inferred if not stated explicitly
-- There is no untyped data in Haskell
-- Code behaves more predictably due to the focus on types
-- Every expression's type is known at compile time. If there are types that don't work, the program won't compile


-- * Native Types
-- Integral numbers
---- Int - Used for whole numbers. Bounded, so it has a minimum value and a maximum value depending on your computer's CPU
---- Integer - Unbounded, so it is used for really big numbers. Will hold any integer up to the limit of your machine's memory. Less efficient than Int
-- Fractional
---- Float - Decimal number with single precision to 32 bits. Used for numbers with decimals. 
---- Double - Decimal number with double precision to 64 bits. More memory intensive than float. Using Double helps to avoid rounding errors with Float.  
---- Rational - Arbitrary precision, stores number as evolving fraction. 
-- Char - Values represent unicode characters. Denoted by single quotes 'c'.
-- List [] - Homogeneous data structure, meaning all items in a list must be the same type. Syntax can be deconstructed as 2:3:4:[]. The type of a list might look like [Int], [Bool], or [Double]. 
-- String [Char] - Strings represent a list of characters. For string use double quote "string". "Hey" is interchangeable with as ['H', 'e', 'y'].
-- Bool - Boolean. Either True or False
-- Tuples () - Tuples contain an arbitrary (but fixed) amount of members. Can have members of varying types and it takes on the types of its components. Unlike lists, you can't increase or reduce the size of a tuple. Types of tuples depend on the types, order, and quantity of its elements. For example: (Char, Bool, Char, Int). A single element tuple gets evaluated to only the element. An empty Tuple is its own type of ().
-- Polymorphic types - A polymorphic value can have multiple types. This is useful in cases where you want to accept many types of data, or if the data type is not important (ex. a function that returns the first of two values). While specific types are capitalized (Bool), polymorphic types are lower case (a). 'a' can represent any type, but all variables with the type 'a' must be the same type.
-- Maybe - data  Maybe a     = Nothing | Just a  deriving (Eq, Ord, Read, Show)
-- Either - data  Either a b = Left a | Right b  deriving (Eq, Ord, Read, Show)
-- Ordering - data  Ordering = LT | EQ | GT deriving (Eq, Ord, Bounded, Enum, Read, Show)
-- IO - IO means running a program than involves it may contain side effects


-- * Type Examples
intType = 3 :: Int --Int --Defaults to integer if not specifically defined 
integerType = 382938834249328432943982483289 --Integer 
floatType = 2.0 :: Float --Float --Defaults to double if not specifically defined
doubleType = 3.5543543543 --Double
rationalType = 3.324325364 :: Rational --Rational --Defaults to double if not specifically defined
charType = 'a' --Char
listType = [1,2,3,4] --[Integer]
stringType = "Jameson" --[Char]
stringType2 = ['T','u','c','k','e','r'] --[Char]
stringType3 = 'T':'u':'c':'k':'e':'r':[] --[Char]
boolType = True --Bool
tupleType = (2, "Tucker", 'C', 3.4) --(Integer, [Char], Char, Double)
maybeType = Just 10 --Maybe Integer
eitherType = Left 34 --Either Integer b
orderingType = LT --Ordering


-- * Checking Type
-- :t command is used to tell what type something is
-- :t 'a' returns Char
-- :t True returns Bool
-- :t "HELLO!" returns [Char]
-- :t (True, 'a') returns (Bool, Char)
-- :t 4 == 5 returns Bool


-- * Type variables aka polymorphism
-- If a function works on multiple types, it will use type variables rather than explicit defined types
-- Functions that use type variables are called polymorphic functions
-- Polymorphism - type signatures that can represent more than one type
-- ex. length :: [a] -> Int. [a] is used because because the type function works on any type of list (numbers, letters, etc.)
-- ex. fst :: (a, b) -> a.  a and b are used because they can be different types

-- * Variables, Definitions, or Names
-- These are functions that don't take any parameters and return a specific piece of data. 
-- You can give them a type signature to ensure that the provided data is the correct type. 
-- These 'variables' are immutable and can't be changed. 
-- The below is another way of saying that "Bob" and name are interchangeable throughout the rest of the program in the same scope. 
name :: String
name = "Bob"


-- * Function definitions
-- Functions can be given a name and explicit type signature (first line) and a name and function definition (second line)
-- Params are separated by ->, with return always coming last
sumAndAddTwo :: Int -> Int -> Int
sumAndAddTwo x y = x + y + 2

-- Type declarations can be added for many inputs
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- If not given a type, Haskell will infer it based on requirements of functions 
london u = "London " ++ u

demoTypeInference = london "hey" --"London hey"