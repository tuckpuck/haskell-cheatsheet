-- * Type Info
-- Types are like a label that is attached to data that defines and limits what that data can do.
-- To attach them, use :: operator, where you "set the type". The entire line with the :: operator is called the type signature, it is read as "has type of".
-- The type of any expression, value, or function can be explicitly stated, otherwise it will be inferred by Haskell's compiler.
-- Every expression's type is known at compile time. If there are types that don't work, the program won't compile.
-- Type checking is the process of verifying and enforcing constraints on data. This helps avoid preventable mistakes. If there is a mismatch, the compiler will throw a "type error". Code behaves more predictably due to the focus on types.

-- * Checking Type
-- :t command is used to tell what type something is
-- :t 'a' returns Char
-- :t True returns Bool
-- :t "HELLO!" returns [Char]
-- :t (True, 'a') returns (Bool, Char)
-- :t 4 == 5 returns Bool

-- * Type signature
-- The type signature (first line) sets the function name and types of the parameters and what it it expected to return. 
-- The function definition (second line) is  what is executed when the function is called
-- Params are separated by ->, with return type always coming last
sumAndAddTwo :: Int -> Int -> Int
sumAndAddTwo x y = x + y + 2

-- Type declarations can be added for many inputs
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- * Type inference
-- If not given a type, Haskell will infer it based on requirements of functions 
expectsString u = "hey " ++ u
mustPassString = expectsString "London" --"hey London"
expectsList u = ["Tokyo"] ++ u
mustPassList = expectsList ["New York"] --["Tokyo","New York"]

-- * Native Types Overview
-- Integral numbers
------ Int - Used for whole numbers. Bounded, so it has a minimum value and a maximum value depending on your computer's CPU
------ Integer - Unbounded, so it is used for really big numbers. Will hold any integer up to the limit of your machine's memory. Less efficient than Int
-- Fractional
------ Float - Decimal number with single precision to 32 bits. Used for numbers with decimals. 
------ Double - Decimal number with double precision to 64 bits. More memory intensive than float. Using Double helps to avoid rounding errors with Float.  
------ Rational - Arbitrary precision, stores number as evolving fraction. 
-- Bool - Boolean. Either True or False
-- Char - Values represent unicode characters. Denoted by single quotes 'c'.
-- String [Char] - Strings represent a list of characters. For string use double quote "string". "Hey" is interchangeable with as ['H', 'e', 'y'].

-- * Integral or Numeric Types
-- These can be any natural number, both positive or negative
-- If using a negative number, surround it in parenthesis (-3)

------ * Int
-- Int has better performance and should be used when possible
-- Int is bounded to 2^63 for 64 bit CPUs
intType = 3 :: Int --Int 
-- This is about the maximum size you can do for Int type numbers
maxInt :: Int
maxInt = 2^62
-- This should result in 0 on 64 bit CPUs because it is over the size limit 
overMaxInt :: Int
overMaxInt = 2^64

------ * Integer
-- Integer is arbitrary precision type: it can hold any integer no matter how big
integerType = 38293883424932843294398248320972389473927432974392749328289 --Integer 
-- Numbers default to integer if not specifically defined 

-- * Fractional Types
-- Decimal numbers default to double if not specifically defined
-- Float allows for faster performance, but it is still recommended to use double in general so you don't encounter rounding errors. 


------ * Float
-- Float is a real floating point number with single precision (32 bits)
-- Float has precision to about 7 decimal places
floatType = 2.0 :: Float --Float

------ * Double 
-- Double is a real floating point number with double the precision (64 bits)
-- Double has precision to about 15 decimal places
doubleType = 3.5543543543 --Double

------ * Rational
-- When even more precision is needed, use the Rational data type because it doesn't have the same rounding features as floating-point.  
rationalType = 3.324325364 :: Rational --Rational 

-- * Bool 
-- Booleans can be True or False
-- Expressions with a comparison operator produce a Bool value
-- Expressions with && or || operators produce a Bool value
boolType = True --Bool
boolComp = 3 >= 9 -- Bool
boolAnd = True && False -- Bool

-- * Char
-- Char is the type used to represent a unicode character.
-- These can be letters, numbers, or symbols.
-- Chars are surrounded by single quotes, ex 'x'
-- You can only write a single character at a time. 'hi' is not a valid Char. 
-- If you write a number in single quotes, ex '7', it will be treated as Char instead of a number.
charType = 'a' --Char

-- * String
-- Strings are lists of characters. 
-- Strings are surrounded by double quotes. Can also be expressed as a list of Chars. 
-- String type is the same as [Char] type. "hi" is just syntactic sugar, or shorthand, for ['h','i']. 
-- Because strings are really [Char] lists, these all are essentially equivalent and have the same type:
stringType = "Tucker" --[Char]
stringType2 = ['T','u','c','k','e','r'] --[Char]
stringType3 = 'T':'u':'c':'k':'e':'r':[] --[Char]

-- * Type variables aka polymorphism
-- Polymorphic types - A polymorphic value can have multiple types. This is useful in cases where you want to accept multiple types of data, or if the data type is not important (ex. a function that returns the first of two values). 
-- While specific types are capitalized (Bool), polymorphic types are lower case (a, b, c, etc.). 'a' can represent any type, but all variables with the type 'a' must be the same type. Checking the types for fst and snd is a good illustration of this. 
-- The length function uses the 'a' type because the length function can work on multiple types (numbers, lists, etc.).
length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length xs

-- Fst is another example where 'a' and 'b' are are polymorphic types because the types within the tuple can be any type.
fst' :: (a, b) -> b
fst' (_, y) = y

