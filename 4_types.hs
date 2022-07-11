-- * Type Info
-- There is no untyped data in Haskell
-- The type of any expression, value, or function can be explicitly stated
-- Types of variables and functions are inferred if not stated explicitly
-- Code behaves more predictably due to the focus on types
-- Every expression's type is known at compile time. If there are types that don't work, the program won't compile
-- The :: operator is read as "has type of"


-- * Native Types
-- Integral numbers
---- Int - Used for whole numbers. Bounded, so it has a minimum value and a maximum value depending on your computer's CPU
---- Integer - Unbounded, so it is used for really big numbers. Less efficient than Int
-- Fractional
---- Float - Decimal number with single precision to 32 bits. Used for numbers with decimals. 
---- Double - Decimal number with double precision to 64 bits. More memory intensive than float. 
---- Rational - Arbitrary precision, stores number as evolving fraction. 
-- Char - Values represent unicode characters. Denoted by single quotes 'c'.
-- List [] - All items in a list must be the same type. Syntax can be deconstructed as 2:3:4:[].
-- String [Char] - String is a list of characters. For string use double quote "string".
-- Bool - Boolean. Either True or False
-- Tuples () - Tuples contain an arbitrary (but constant) amount of members. Can have members of varying types and it takes on the types of its components. An empty Tuple is its own type of ().
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


-- * Function definitions
-- Functions can be given an explicit type declaration
-- Params are separated by ->, with return always coming last
sumAndAddTwo :: Int -> Int -> Int
sumAndAddTwo x y = x + y + 2

-- Type declarations can be added for many inputs
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- If not given a type, Haskell will infer it based on requirements of functions 
london u = "London " ++ u

demoTypeInference = london "hey" --"London hey"