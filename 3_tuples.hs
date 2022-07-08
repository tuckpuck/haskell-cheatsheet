-- Tuples are similar to lists, but they can contain multiple different types. 
-- Type of overall tuple is inherited from underlying type. 
tupleExample = ("Tucker", "Triggs", 29, True) --("Tucker","Triggs",29,True)
-- tupleExample :: ([Char], [Char], Integer, Bool)

tupleOfLists = ([1,2], [6,5,4], [2,4]) --([1,2],[6,5,4],[2,4])
tupleOfTuples = ((1,2), (3,5), (3,8,6)) --((1,2),(3,5),(3,8,6))

-- Fst and snd work on tuple pairs
getFirst = fst (3,9) --3
getSecond = snd (3,9) --9

-- You can pattern match tuples like this:
addTupleOfInts :: (Int, Int) -> Int
addTupleOfInts (x, y) = x + y

demoAddTupleOfInts = addTupleOfInts (5,4)

-- Zip can combine two lists into a list of tuples
zipEx = zip [1,2,3] ["one", "two", "three"] --[(1,"one"),(2,"two"),(3,"three")]

-- Unzip takes a list of tuples, and gives a tuple of lists
unZipEx = unzip [(1,2),(3,4),(5,6)] --([1,3,5],[2,4,6])

-- Tuples can also be used inside list comprehensions
tupleComprehension = [ (x, y) | x <- [1, 2, 3], y <- "st" ] --[(1,'s'),(1,'t'),(2,'s'),(2,'t'),(3,'s'),(3,'t')]
