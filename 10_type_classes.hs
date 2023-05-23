-- Type classes define a set of features
-- When you define something in a type class, you can use that set of features


-- A typeclass guarantees certain properties or functionality
-- Types have an instance of a type class
-- If a type is of a type class, you say that type has an instance of a type class

-- Type classes are like interfaces. They describe how the data is used rather than what it is. 


-- Common typeclasses:
-- Num (Negation, conversion from Integer type, and sign)
-- Bounded (min and max)
-- Ord (Ordered by comparison > < >= <=)
-- EQ (Describes types where equality is knowable == /=)



-- Constrained polymorphism:
-- (Eq a) => a -> a -> Bool

-- Type classes are ordered and can specify prerequisites
-- Ex. EQ > Ord > Enum


-- Class constraint 
add :: Num a => a -> a -> a
add a b = a + b



-- Type classes define a set of features
-- When you define something in a type class, you can use that set of features




data List a = Empty | Cons a (List a) deriving (Show, Eq, Ord)

class Show' a where 
    show' :: a -> String

instance Show' a => Show' (List a) where
    show' (Empty) = "Empty"
    show' (Cons a xs) = "Cons " ++ show' a ++ show' xs

instance Show' Int where
    show' x = show x















data Temperature = Celsius Float | Fahrenheit Float 


instance Show Temperature where
    show (Celsius x) = "The temperature is " ++ show x ++ " in Celsius"
    show (Fahrenheit n) = "The temperature is " ++ show n ++ " in Fahrenheit"

instance Eq Temperature where
    (==) (Celsius x) (Celsius y) = x == y
    (==) (Fahrenheit x) (Fahrenheit y) = x == y
    (==) (Celsius x) (Fahrenheit y) = (1.8 * x + 32) == y 
    (==) (Fahrenheit x) (Celsius y) = (1.8 * y + 32) == x 

instance Num Temperature where
    (+) (Celsius x) (Celsius y) = Celsius (x+y)
    (+) (Fahrenheit x) (Fahrenheit y) = Fahrenheit (x+y)
    (+) (Celsius x) (Fahrenheit y) = Celsius (x + (y-32)/1.8)
    (+) (Fahrenheit x) (Celsius y) = Fahrenheit (x + y * 1.8 + 32)
    negate (Celsius x) = Celsius (negate x)
    negate (Fahrenheit x) = Fahrenheit (negate x)
    (*) (Celsius x) (Celsius y) = Celsius (x * y)
    (*) (Fahrenheit x) (Fahrenheit y) = Fahrenheit (x * y)
    (*) (Celsius x) (Fahrenheit y) = Celsius (x * ((y-32)/1.8))
    (*) (Fahrenheit x) (Celsius y) = Fahrenheit(x * (y*1.8 + 32))
    signum (Celsius x) = Celsius (signum x)
    signum (Fahrenheit x) = Fahrenheit (signum x)
    fromInteger (x) = Celsius (fromInteger x)
    abs (Celsius x) = Celsius (abs x)
    abs (Fahrenheit x) = Fahrenheit (abs x)

    -- abs
    -- signum



    
-- fToC :: Int -> Float
-- fToC = 





-- 'Num a' is a type restriction. a is a type variable. The variables can be any type of number, but they all must be the same type. Variables like this are called polymorphic.
plus :: Num a => a -> a -> a
plus x y = x + y




-- Type classes are  a set that holds types. They define methods that the types can use. 
-- Read is used to convert to an integer
tryRead = read "5" + 10
-- If it doesn't have context, we can say what type it should go to 
tryRead' = read "5" :: Integer
