-- * Native Tuple Functions
-- Fst and snd work on tuple pairs
getFirst = fst (3,9) --3
getSecond = snd (3,9) --9

-- Tuples can be compared (like lists), but tuples of different sizes or cannot be compared (unlike lists), nor can tuples of different types. 
compare1 = (1,2,3) == (1,2,3) --True
compare2 = (1,2,3) == (1,2,4) --False
-- compare3 = (1,2,3) == ("hi", 2,3) --Throws error
-- compare4 = (1,2,3) == (1,2,3,4) --Throws error

-- You can pattern match tuples like this:
addTupleOfInts :: (Int, Int) -> Int
addTupleOfInts (x, y) = x + y
demoAddTupleOfInts = addTupleOfInts (5,4) --9

-- Tuples can also be used inside list comprehensions
tupleComprehension = [ (x, y) | x <- [1, 2, 3], y <- "st" ] --[(1,'s'),(1,'t'),(2,'s'),(2,'t'),(3,'s'),(3,'t')]

-- Zip can combine two lists into a list of tuples
zipEx = zip [1,2,3] ["one", "two", "three"] --[(1,"one"),(2,"two"),(3,"three")]
-- If lengths don't match, zip will simply ignore the rest of the longer list
zipIgnoreExtra = zip [5,3,2,6,2,7,2,5,4,6,6] ["I'm", "a", "turtle"] --[(5,"I'm"),(3,"a"),(2,"turtle")]
zipIgnoreExtraInfinite = zip [1..] ["apple", "orange", "cherry", "mango"] --[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]

-- Unzip takes a list of tuple pairs, and gives a tuple of lists
unZipEx = unzip [(1,2),(3,4),(5,6)] --([1,3,5],[2,4,6])
