import Debug.Trace 

-- * Recursion
-- Recursion is when a function that calls itself until it reaches its solution. 
-- Anything that can be accomplished via iteration can be done using recursion.
-- Haskell has only recursion, no looping.
last' :: [a] -> a 
last' (x:[]) = x 
last' (x:xs) = last' xs

-- Failure in recursion
-- Infinite recursion - If the recursive function does not have a proper termination condition or if the termination condition is not reached due to some logical error, the recursion can continue indefinitely, resulting in an infinite loop. This can cause the program to run out of memory or hang indefinitely.
-- Stack overflow - Haskell uses a call stack to keep track of function calls. If the recursion goes too deep without proper termination, it can exhaust the call stack space, leading to a stack overflow error.
-- Incorrect base case - If the base case(s) of the recursive function is not defined correctly, it can lead to unexpected behavior or incorrect results.
-- Incorrect recursive call - If the recursive call within the function is not defined correctly or if the arguments passed to the recursive call are incorrect, it can lead to incorrect results or unexpected behavior.

-- Debug.Trace can be used to show the steps that the recursion takes. (Imported above).
last'' :: [Int] -> Int
last'' (x : []) = x 
last'' (x:xs) = trace ("xs = " ++ show xs) (last'' xs)
traceLast = last'' [1..17]

-- * Factorial created using recursion in different control flow structures
-- Factorial using pattern matching
factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial x = x * factorial (x - 1)

-- Factorial using guards
factorial' :: Integer -> Integer
factorial' n
  | n == 0 = 1
  | otherwise = n * factorial' (n - 1)

-- Factorial using case statement
factorial'' :: Integer -> Integer
factorial'' n = case (n > 0) of  
    False -> 1
    True -> n * factorial'' (n - 1) 

-- Factorial using if/then/else
factorial''' :: Integer -> Integer
factorial''' n = if n <= 0 then (1) else n * factorial''' (n - 1)

-- Safe factorial to cover negative numbers using if else
safeFactorial :: Integer -> Integer
safeFactorial 0 = 1
safeFactorial n = if n < 0 then (-1) else n * safeFactorial (n - 1)

-- * Inductive vs Iterative recursion
-- The problem will determine which one you use. Some problems lend themselves to inductive recursion. But sometimes iterative is needed.

-- Inductive recursion involves breaking down a problem into smaller subproblems and solving each subproblem recursively until a base case is reached. 
-- Factorial written like this is an example of inductive recursion. 
factorial_ind :: Int -> Int
factorial_ind 0 = 1
factorial_ind 1 = 1
factorial_ind x = x * factorial (x - 1)

-- Iterative recursion involves solving a problem iteratively using a loop or iteration construct.
-- Loops are not native to Haskell, but can be emulated
-- Can be helpful because you can introduce an accumulator value where you 'store' a value
-- Factorial can be written in an iterative way
factorial_iter :: Int -> Int
factorial_iter x = loop 1 1 where
  loop acc i
    | i > x = acc 
    | otherwise = loop (acc * i) (i + 1)
    
-- * More Recursion Examples
numList :: [Int]
numList = [1..22]

length' :: [a] -> Int
length' [] = 0
length' list = 1 + length (tail list)

findLength = length' numList
findStrLength = length' "Hello"

length'' :: [a] -> Int
length'' [] = 0
length'' (x:xs) = 1 + length'' xs

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- Special pattern to split lists
specialSum :: [Int] -> Int
specialSum [] = 0
specialSum [x] = x
-- specialSum 
specialSum (x:y:zs) = y

-- Create a function that takes the sum of every two numbers in a list
sumOf2 :: [Int] -> [Int]
sumOf2 [] = []
sumOf2 [x] = [x]
sumOf2 (x:y:zs) = x + y : sumOf2 zs

example1 = sumOf2 [1]
example2 = sumOf2 [1,2]
example3 = sumOf2 [1..50]

-- Recursive function to add two to all
-- (Int->Int) in this case is a function
applyToAll :: (Int -> Int) -> [Int] -> [Int]
applyToAll _ [] = []
applyToAll f (x:xs) = (f x) : applyToAll f xs

addTwo = applyToAll (+2) [2,3,4,5]

multiplyByTwo = applyToAll (*2) [2,3,4,5]

map' :: (a -> b) -> [a] -> [b]
map' _ [] = [] 
map' f (x:xs) = f x : map f xs 
mapNums = map' (+10) [1,2,3,4]
mapStrings = map' reverse ["hello", "good morning"]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs 

sum'' :: [Int] -> Int
sum'' [] = 0
sum'' (x:xs) = x + sum xs

listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

addListInts :: [Int] -> Int
addListInts [] = 0
addListInts [x] = x
addListInts (x:xs) = x + addListInts xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n xs = case xs of { x : xs -> x : take' (n - 1) xs }