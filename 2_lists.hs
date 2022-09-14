-- * Lists and Native Functions
-- List syntax
-- Lists must be of a single type
numList = [1,2,4,5,6,8] --[1,2,4,5,6,8]

-- Get an element from a list using !!
item3 = [1,2,3,4,5,6] !! 2 --3

-- 'null' method checks whether a list is empty
isNull = null [] --True
isNotNull = null [1,2,3] --False

-- Head returns the first element
getHead = head [1,2,3,4,5] --1

-- Tail returns all the elements except the first
getTail = tail [1,2,3,4,5] --[2,3,4,5]

-- Init returns all elements besides the last
getInit = init [1,2,3,4,5] --[1,2,3,4]

-- Last returns the last element
getLast = last [1,2,3,4,5] --5

-- If you try to run an above slicing function (head,tail,init,last) on an empty list it will throw error, but it is not caught at compile time

-- Take returns n elements from the start of the list
takeElems = take 3 [1,2,3,4,5,6,7] --[1,2,3]

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

-- Reverse reverses a list
revList = reverse [1,2,3,4,5] --[5,4,3,2,1]
-- Sum takes a list of numbers and returns their sum
findSum = sum [1,2,3,4,5,6,7,8,9,10] --55

-- Product takes a list of numbers and returns their product
findProduct = product [1,2,3,4,5,6,7,8,9,10] --3628800

-- Ranges allows you to create lists iteratively using the .. operator
numRange = [1..15] --[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
charRange = ['a'..'x'] --"abcdefghijklmnopqrstuvwx"
charRangeCap = ['A'..'X'] --"ABCDEFGHIJKLMNOPQRSTUVWX"

-- A step can be added to change the interval between items. Separate the first two items with a comma, add .., then specify upper limit
-- Can only specify a single step 
countByTwo = [2,4..20] --[2,4,6,8,10,12,14,16,18,20]
countByThree = [3,6..20] --[3,6,9,12,15,18]
everyOtherLetter = ['a', 'c'..'z'] --"acegikmoqsuwy"

-- Infinite lists can be created by making a range with no upper limit
infiniteList = [1..]
-- You can use an infinite list for one zip param because Haskell will stop at the length of the shorter list
zipInf = zip [1..] ["one", "two", "three", "four"] --[(1,"one"),(2,"two"),(3,"three"),(4,"four")]
zipInf2 = zip [1,2,3,4,5,6] (cycle [0,1,2]) --[(1,0),(2,1),(3,2),(4,0),(5,1),(6,2)]

-- zipWith takes an argument and runs it on the pairs
zipListsWith = zipWith (+) [1..10] [1..10] --[2,4,6,8,10,12,14,16,18,20]

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

-- List comparison
-- Lists are compared in lexicographical order. First the first one is compared. Only if they are equal then the second item is compared. That's why this evaluates to True.
comp0 = [3,2,1]>[2,10,100] --True
comp1 = [3,2,1]>[2,1,0] -- True
comp2 = [3,2,1]>[2,10,100] -- True
comp3 = [3,4,2]<[3,4,3] -- True
comp4 = [3,4,2]>[2,4] -- True
comp5 = [3,4,2]==[3,4,2] -- True
--Nonempty lists is always considered greater than an empty one. 
comp6 = [] > [1] --False

-- List concatenation operators
-- The cons operator (:) adds an element to the beginning of a list
-- Much faster than adding to end of big list (because Haskell then has to go through entire list)
listOf3 = 1 : [2,3]
listOf10 = (:) 1 [2..10] --[1,2,3,4,5,6,7,8,9,10]
listOf1 = (:) 1 [] --[1]

-- The ++ operator is used to add two lists together
concatLists = (++) [1..10][11..20] --[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
concatString = 'A':" Small Cat" --"A Small Cat"


-- Map applies an operation to each element in a list
mapList = map (+1) [1..10] --[2,3,4,5,6,7,8,9,10,11]

-- Filter runs a conditional on each element in list and returns a list of those that were True
filterList = filter (>5) [1..10] --[6,7,8,9,10]
filterList2 = filter (== 'e') ['a'..'g'] --"e"

-- Lists in lists
-- Lists in lists also have to be of a single type
listInList = [[1,2,3,4],[5,6,7,8],[9,10,11,12]] --[[1,2,3,4],[5,6,7,8],[9,10,11,12]]
-- Add another list within a list to end
listInListConcat = listInList ++ [[13,14,15,16]] --[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
-- Add another list within a list to the front
listInListCons = [2,3,5] : listInList --[[2,3,5],[1,2,3,4],[5,6,7,8],[9,10,11,12]]

helloWorld = "hello" ++ "world" --"helloworld"
listWorld = ["hello", "world"] ++ ["g","m"] --["hello","world","g","m"]
consString = 'h':"ello" --consString
consList = "hello " : ["world"] --["hello ","world"]


lists = [["a", "b"], ["c","f"]] 
lists2 = lists ++ [["m", "h"]] --[["a","b"],["c","f"],["m","h"]]

-- Best practice is often to create a safe version of a function
-- Ex. native head function does not handle empty list [] as an input
-- Instead it will throw an exception.
-- A safe function will handle all cases without breaking program

-- Joining and breaking text
-- Words is used to break up a string to list of words
breakUpString :: String -> [String]
breakUpString word = words word
-- Unwords joins a list of words with seperating spaces
joinStrings :: [String] -> String
joinStrings list = unwords list
-- Lines splits the argument into a list of lines with newline (\n) characters
splitIntoListOnNewline :: String -> [String]
splitIntoListOnNewline str = lines str
-- Unlines creates a String from list of Strings by appending  newline (\n) characters. 
listToStringAddNewline :: [String] -> String
listToStringAddNewline list = unlines list


-- * Some List functions
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
