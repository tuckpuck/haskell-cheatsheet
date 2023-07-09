-- * Data Structures
-- List [] - Homogeneous data structure, meaning all items in a list must be the same type. Syntax can be deconstructed as 2:3:4:[]. The type of a list might look like [Int], [Bool], or [Double]. 
-- Tuples () - Tuples contain an arbitrary (but fixed) amount of members. Can have members of varying types and it takes on the types of its components. Unlike lists, you can't increase or reduce the size of a tuple. Types of tuples depend on the types, order, and quantity of its elements. For example: (Char, Bool, Char, Int). A single element tuple gets evaluated to only the element. An empty Tuple is its own type of ().

-- * Lists
-- Lists must be of a single type. They are homogeneous data structures. 
-- The type of a list is shown as the type of the element it contains, surrounded by square brackets. ex. [Char] is a list of characters. 
-- Lists can have unlimited elements as long as they are the same type. 
-- You can change the size of lists by concatenation or by other means. 
numList = [1,2,4,5,6,8] --[Integer]
charList = ['h','e','l','l','o'] --[Char]
stringList = ["hey", "there", "Laura"] --[[Char]]
boolList = [True, False, 3 > 2, 'a'=='b'] --[Bool]

-- * Tuples
-- Tuples can be used to store values of different data types. This is known as a heterogeneous data structure. 
-- They are surrounded by parenthesis. ex ("James", 27) 
-- Tuples have a fixed size. You can't change the size of a tuple. If you set it as N elements it will always be N elements. 
-- The type of a Tuple depends on the type, order, and quantity of its elements. Types of tuple is inherited from underlying types. 
-- There are no single element tuples, Haskell will just return the element itself. ex ("James") will return "James".
mixedTuple = ("Tucker", "Triggs", 29, True) --("Tucker","Triggs",29,True)
-- tupleExample :: ([Char], [Char], Integer, Bool)
tupleOfLists = ([1,2], [6,5,4], [2,4]) --([1,2],[6,5,4],[2,4])
tupleOfTuples = ((1,2), (3,5), (3,8,6)) --((1,2),(3,5),(3,8,6))
