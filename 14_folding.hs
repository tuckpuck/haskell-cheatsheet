-- * Folding
-- Folding is the process of reducing a list (or any other data structure) to a single value by applying a function to each element alongside an accumulator. 
-- In other languages this is called 'reduce'.

-- * Foldl vs Foldr
-- There are two main types, foldr and foldl. 
-- With foldr, the second input in the lambda expression is the accumulator but it accumulates backwards. 
-- ex. in foldr, (\x s -> x + s) 0 [2,7,11,4]), s is 2 + (7 + (11 + (4 + 0)))

-- With foldl, the second input in the lambda expression is the accumulator. 
-- ex. in foldl, (\x s -> x + s) 0 [2,7,11,4]), s is (((2 + 7) + 11) + 4) + 0

-- In haskell, foldr is often more useful due to lazy evaluation. 
-- Foldr is useful when you are trying to build up a list. 
-- Foldl is useful when you are trying to reduce the list into a single item. 
-- For operations that are associative (like + for example. they are the same result whether applied from left to right) then the result won't change whether you use foldl or foldr

-- * foldl type: 
-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- `(b -> a -> b)` is a function that takes 2 inputs (`b` the element and `a` the accumulator)
-- `b` is the initial accumulator value
-- `[a]` is the list to be folded. 
-- The function returns a single value of type `b`.

-- Get the sum of a list using foldl
sumList xs = foldl (\acc x -> acc + x) 0 xs

-- Another way to write sum using foldl
sumList' = foldl (\h r -> h + r) 0 [1..100]

-- * foldr type: 
-- foldl :: (a -> b -> b) -> b -> [a] -> b
-- `(a -> b -> b)` is a function that takes 2 inputs (`a` the element and `b` the accumulator)
-- `b` is the initial accumulator value
-- `[a]` is the list to be folded. 
-- The function returns a single value of type `b`.

-- Get product using foldr 
getProduct lst = foldr (\acc x -> acc * x) 1 lst


myLength = myFoldr (\ x r -> 1 + r) 0

myMap :: (a -> b) -> [a] -> [b]
myMap f list = foldr (\x xs -> f x : xs) [] list

greaterThan2 :: Int -> [Bool] -> [Bool]
greaterThan2 y z = ((>2) y) : z

testFoldr = foldr greaterThan2 [] [1..5]

myFoldr :: (a -> b -> b) -> b -> [a] -> b 
myFoldr _ nil [] = nil
myFoldr f nil (x:xs) = f x (myFoldr f nil xs)

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ i [] = i
foldr' f i (x:xs) = x `f` foldr' f i xs

sumIt = foldr' (+) 20
sumEx = sumIt [20, 34, 53]

-- * ID
-- id is the identity function.
-- It is a function that always returns the value that was used as its argument, unchanged
-- In this case is used to mean 'dont do anything and continue evaluating'
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f list = foldr (\x -> if (f x) then (x:) else id) [] list
