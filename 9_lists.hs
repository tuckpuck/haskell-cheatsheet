-- * Native List Functions
-- Get a specific element from a list using !!. Starts at index 0. 
item3 = [1,2,3,4,5,6] !! 2 --3

-- Head returns the first element
getHead = head [1,2,3,4,5] --1

-- Tail returns all the elements except the first
getTail = tail [1,2,3,4,5] --[2,3,4,5]

-- Init returns all elements besides the last
getInit = init [1,2,3,4,5] --[1,2,3,4]

-- Last returns the last element
getLast = last [1,2,3,4,5] --5
-- FYI — If you try to run an above slicing function (head,tail,init,last) on an empty list it will throw error, but it is not caught at compile time

-- Null checks whether a list is empty
isNull = null [] --True
isNotNull = null [1,2,3] --False

-- Take returns n elements from the start of the list
takeElems = take 3 [1,2,3,4,5,6,7] --[1,2,3]
takeXElems x = take x [1..]

-- Drop removes n elements from the start of the list and returns the rest
dropElems = drop 3 [1,2,3,4,5,6,7] --[4,5,6,7]

-- Cycle repeats a list indefinitely. It works well combined with take
cycleList = take 20 (cycle [0,1,1,0,0,1]) --[0,1,1,0,0,1,0,1,1,0,0,1,0,1,1,0,0,1,0,1]
cycleWords = take 14 (cycle "honk ") --"honk honk honk"

-- Repeat takes a value and creates an infinite list of that value. Works well combined with take
repeatElem = take 20 (repeat 4) --[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]
repeatLetter = take 20 (repeat('h')) --"hhhhhhhhhhhhhhhhhhhh"

-- Replicate is another way to create a list composed of single item. Takes the length of the list and item to replicate
replicateList = replicate 10 100 --[100,100,100,100,100,100,100,100,100,100]
replicateLetter = replicate 10 "hey" --["hey","hey","hey","hey","hey","hey","hey","hey","hey","hey"]

-- Length returns the length of a list
listLen = length [1,2,3,4,5] --5

-- Maximum returns the highest number in a list
listMax = maximum [3,6,21] --21

-- Minimum returns the lowest number in a list
listMin = minimum [3,6,21] --3

-- Elem checks if an item is in a list. Usually done as infix
listElem1 = 3 `elem` [1,2,3,4] --True
listElem2 = 5 `elem` [1,2,3,4] --False

-- Zip takes 2 lists and zips them into tuple pairs
zipLists = zip [1,2,3,4,5] [6,7,8,9,10] --[(1,6),(2,7),(3,8),(4,9),(5,10)]

-- zipWith takes an argument and runs it on the pairs
zipListsWith = zipWith (+) [1..10] [1..10] --[2,4,6,8,10,12,14,16,18,20]

-- Reverse reverses a list
revList = reverse [1,2,3,4,5] --[5,4,3,2,1]

-- Sum takes a list of numbers and returns their sum
findSum = sum [1,2,3,4,5,6,7,8,9,10] --55

-- Product takes a list of numbers and returns their product
findProduct = product [1,2,3,4,5,6,7,8,9,10] --3628800

-- Map applies an operation to each element in a list
mapList = map (+1) [1..10] --[2,3,4,5,6,7,8,9,10,11]
mapNames = map fst [("James", 23), ("Simon", 95), ("Samantha", 45)]

-- Filter runs a conditional on each element in list and returns a list of those that were True
filterList = filter (>5) [1..10] --[6,7,8,9,10]
filterList2 = filter (== 'e') ['a'..'g'] --"e"

-- * List concatenation operators
-- The cons operator (:) adds an element to the beginning of a list.
-- Much faster than adding to end of a list (because Haskell then has to go through entire list).
-- Cons takes an element as first param and list as second. If you try [2,3]:1 it will throw an error.
-- Cons is short for constructor.
listOf3 = 1 : [2,3]
listOf10 = (:) 1 [2..10] --[1,2,3,4,5,6,7,8,9,10]
listOf1 = (:) 1 [] --[1]
consString = 'h':"ello" --'hello'
consList = "hello " : ["world"] --["hello ","world"]
-- In reality, lists are stored like this 'w':('o':('r':('l':('d':[])))). String syntax is just syntatic sugar. 

-- The ++ operator is used to add two lists together
combineStrings = "hello" ++ " there"
combineNumLists = (++) [1..10][11..20] --[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
combineStringLists = ["hello", "world"] ++ ["g","m"] --["hello","world","g","m"]
combineListsOfLists = [["a", "b"], ["c","f"]] ++ [["m", "h"]]

-- Lists in lists
-- Lists in lists also have to be of a single type
listInList = [[1,2,3,4],[5,6,7,8],[9,10,11,12]] --[[1,2,3,4],[5,6,7,8],[9,10,11,12]]
-- Add another list within a list to end
listInListConcat = listInList ++ [[13,14,15,16]] --[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
-- Add another list within a list to the front
listInListCons = [2,3,5] : listInList --[[2,3,5],[1,2,3,4],[5,6,7,8],[9,10,11,12]]

-- * How lists are constructed
-- Lists are really constructed by the : operator, and are decomposed by head and tail functions
-- The end of the list must end with a null list, so that Haskell knows that it is the end of the list. 
-- invalidList = 1 : (2 : (3))
validList = 1 : (2 : (3 : []))
validList2 = 1 : (2 : ([3]))

isSameDemo = [1,2,3,4] == 1 : (2 : (3 : (4 :[])))
isSameDemo2 = 2 : (3 : (4 : (5 : (6 : (7 : []))))) == [2,3,4,5,6,7]
isSameDemo3 = [2,3,4] == 2 : [3,4] && 2 : (3 : [4]) == 2 : (3 : (4 : []))
checkHead = head (2 : (3 : (4 : (5 : (6 : (7 : []))))))
checkTail = tail (2 : (3 : (4 : (5 : (6 : (7 : []))))))

-- * (x:xs) pattern
-- This pattern uses the cons operator to pattern match.
-- Because of how lists are stored in memory, it is easy to capture the head and tail.
-- They typical pattern is x:xs. x is the head, and xs is the tail. xs is the plural of x. 
m:n = [1,2,3,4,5]
-- m is 1
-- n is [2,3,4,5]

-- You can also pattern match items following the head item by adding more letters between cons.
y = [5,6,7,8,9]
h:i:j = y
-- h is 5
-- i is 6
-- j is [7,8,9]

a:b:c:d:e:f = "world"
-- a = 'w'
-- b = 'o'
-- c = 'r'
-- d = 'l'
-- e = "d"
-- f = ""
-- The last letter can never be returned as a character via this method.
-- That is why d is a list, not a char.

-- Underscore is used to show a value is not needed. _ does not change the program execution, it is a note for developers looking at the program. 
-- ex.
-- first :: [a] -> a 
-- first (x:_) = x

-- * List comparison
-- Lists are compared in lexicographical order. First the first one is compared. Only if they are equal then the second item is compared. That's why this evaluates to True.
comp0 = [3,2,1]>[2,10,100] --True
comp1 = [3,2,1]>[2,1,0] -- True
comp2 = [3,2,1]>[2,10,100] -- True
comp3 = [3,4,2]<[3,4,3] -- True
comp4 = [3,4,2]>[2,4] -- True
comp5 = [3,4,2]==[3,4,2] -- True
--Nonempty lists is always considered greater than an empty one. 
comp6 = [] > [1] --False

-- * Range
-- Ranges allows you to create lists iteratively using the .. operator
numRange = [1..15] --[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
charRange = ['a'..'x'] --"abcdefghijklmnopqrstuvwx"
charRangeCap = ['A'..'X'] --"ABCDEFGHIJKLMNOPQRSTUVWX"

-- * Infinite List
-- Infinite lists can be created by making a range with no upper limit. 
-- They are usually used as part of expressions that will limit them, otherwise they will urn until they crash your program. 
infiniteList = [1..]
-- You can create an infinite list with steps
odds = [1,3..] --[1,3,5,7,9,11,13,15,17,19...]
-- You can create an infinite list with the alphabet, which will go on to symbols past the letters
alphabet = take 20 ['x'..]

-- You can use an infinite list for one zip param because Haskell will stop at the length of the shorter list
zipInf = zip [1..] ["one", "two", "three", "four"] --[(1,"one"),(2,"two"),(3,"three"),(4,"four")]
zipInf2 = zip [1,2,3,4,5,6] (cycle [0,1,2]) --[(1,0),(2,1),(3,2),(4,0),(5,1),(6,2)]

-- * Steps
-- A step can be added to change the interval between items. Separate the first two items with a comma, add .., then specify upper limit
-- Can only specify a single step 
countByTwo = [2,4..20] --[2,4,6,8,10,12,14,16,18,20]
countByThree = [3,6..20] --[3,6,9,12,15,18]
everyOtherLetter = ['a', 'c'..'z'] --"acegikmoqsuwy"

-- To make a descending list, you must use steps. Otherwise it will increment instead of decrement and end up as an empty list
-- This works:
descendingList = [15,14..0] --[15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]
reverseAlphabet1 = ['z', 'y'..'a'] --"zyxwvutsrqponmlkjihgfedcba"
reverseAlphabet2 = reverse ['a'..'z'] --"zyxwvutsrqponmlkjihgfedcba"

-- Get a certain number of multiples of something
twentyFourMultiplesOfThirteen = [13,26..24*13] --[13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]

-- Better way to get a certain number of items, using infinite list
twentyFourMultiplesOfThirteenInfiniteList = take 24 [13,26..] --[13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]

-- Be careful about using floating-point numbers in ranges because they can have strange results and overshoot upper limit due to their precision
-- For example: 
floatingRange = [0.1,0.3..1] --[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]

-- * Lists in memory 
-- Lists are actually 'linked lists'. At the memory level, this means that not all items `are contiguous, but instead each item gives its value then points to the location of the next item. You have the element, and the location where the next item is stored. The end of the list is represented by a 'null' to show it is the end. 
-- Ex. [3, 17, -11] is {elem: 3, next: 0x23953241} {elem: 17, next: 0x97336542} {elem: -11, next: null}. 
-- You can move forward in memory to the next item because you have the next address, but not backward. 
-- Due to this, you can consider the list only two things: a 'head' and a 'tail'.
-- Why is it stored like this in Haskell? It is perfect for recursion. And it is easier to find blocks in memory that are not contiguous. 
-- To calculate the length of the linked list, you must jump through every element in the list. 
-- Because of this, '!!' and 'last' should be avoided because it is inefficient and the compiler has to go through every element until that one. Unless you are getting one of the first elements, or have a very short list. 

-- * Custom List functions
getFirstLetter :: String -> Char
getFirstLetter s = s !! 0

lengthOfList :: [a] -> Int
lengthOfList lst = length lst

checkIfListEmpty :: [a] -> Bool
checkIfListEmpty list = null list

reverseString :: String -> String
reverseString str = reverse str

getMax :: [Int] -> Int
getMax lst = maximum lst

getMin :: [Int] -> Int
getMin lst = minimum lst

checkIfIsInList :: Eq a => a -> [a] -> Bool
checkIfIsInList item lst = item `elem` lst

first :: [a] -> a 
first (x:_) = x

second :: [a] -> a
second (_:y:_) = y

last' :: [a] -> a
last' [x] = x
last' (x:xs) = last' xs

last'' :: [a] -> Maybe a
last'' [] = Nothing
last'' [x] = Just x
last'' (x:xs) = last'' xs



