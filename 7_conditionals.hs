-- * Conditionals
-- Conditionals are a construct which allows the program to decide between two or more alternatives. 

-- * Pattern matching
-- Matching data (values, types, etc) against a pattern
-- Optionally you can bind variables to successful matches
-- You must provide pattern matches for all possible scenarios. 
-- Haskell matches from top to bottom, so the first definition succeed if it matches multiple. 
-- Pattern matching is straightforward to do different things depending on the structure or value of the arguments. Also makes it easy to extract certain values from tuples and lists. 

-- Catch-all patterns allow you to provide a default case if a provided param does not match anything else. 
-- If you don't care what the value will be, you can use _ as the catchall. 

-- Pattern matching strings
birthday :: Int -> [Char]
birthday 1 = "Welcome to the world"
birthday 18 = "You're an adult"
birthday 55 = "You're an adult fr fr"
birthday age = "Happy birthday, you are " ++ show age

-- Pattern matching lists
type Day = String
yesterday :: Day -> Day
yesterday "M" = "S"
yesterday "Tu" = "M"
yesterday "W" = "Tu"
yesterday "Th" = "W"
yesterday "F" = "Th"
yesterday "Sa" = "F"
yesterday "Su" = "Sa"
yesterday _ = "Error!"

whatsInsideThisList:: [Int] -> String
whatsInsideThisList [] = "It's empty!"
whatsInsideThisList [x] = "A single element: " ++ show x
whatsInsideThisList [x, y] = "Two elements: " ++ show x ++ " and " ++ show y ++ "."
whatsInsideThisList (x:y:z:[]) = "The list has three elements: " ++ show [x, y, z]
whatsInsideThisList (x:rest) = "The first element is: " ++ show x ++ ", and the rest are " ++ show rest
list1=whatsInsideThisList [] -- "It's empty!"
list2=whatsInsideThisList [1, 2] -- "Two elements: 1 and 2"
list3=whatsInsideThisList [1, 2, 3] -- "The list has three elements: [1,2,3]"
list4=whatsInsideThisList [1, 2, 3, 4] -- "The first element is: 1, and there are qui

-- With lists, you can create a catchall using this syntax (_:_:c:_), the final _ means it doesn't matter what is after this or how many elements are after this.
getThirdFromList :: [Int] -> [Int]
getThirdFromList [] = [-1]
getThirdFromList [_] = [-1]
getThirdFromList [_,_] = [-1]
getThirdFromList [_,_,c] = [c]
getThirdFromList (_:_:c:_) = [c]

initials':: String -> String -> String
initials' (f:_) (l:_) = [f] ++ "." ++ [l] ++ "."
initials' _ _ = "How was your name again?"
getIntials = initials' "nikola" "tesla"

findLengthRecusively :: Num a => [a] -> a
findLengthRecusively [] = 0
findLengthRecusively (x:xs) = 1 + findLengthRecusively xs

-- Common pattern to deconstruct Int or Char lists
splitIntList :: [a] -> [a]
splitIntList [] = []
splitIntList (y:ys) = ys

splitCharList :: [a] -> [a]
splitCharList [] = []
splitCharList (y:ys) = ys

-- Can be used to get certain items out of a list
getHead :: [a] -> a
getHead (x:xs) = x

getTail :: [a] -> [a]
getTail (y:ys) = ys

-- Pattern matching Tuples
getSecondFromTuple :: (a,b,c) -> b
getSecondFromTuple (_,y,_) = y

changeTuple :: (a,b,c,d) -> (b,d)
changeTuple (_,x,_,y) = (x, y)

reverseTuple :: (x, y) -> (y, x)
reverseTuple (x, y) = (y, x)

fst :: (a, b) -> a
fst (a, _) = a

snd :: (a,b) -> b
snd (_, b) = b

-- * If then else syntax
-- if <condition>
--   then <expression1>
--   else <expression2>
-- If then else is an expression not a statement. 
-- "If" in haskell must also have "else" because every function must return a value. 

-- This example multiplies a number by 2 if that number is less than 100. 
doubleSmallNumber x = if x > 100 
                        then x 
                        else x * 2

-- To check for multiple conditions using if/then/else, you can use nested conditions. 
type Power = String
type Pokemon = String

choosepokemon_ifelse :: Power -> Pokemon
choosepokemon_ifelse  p =
  if p == "Grass"
  then "Bulbasaur"
  else
    if p == "Fire"
    then "Charmander"
    else
      if p == "Water"
      then "Squirtle"
      else "Pikachu"

fizzBuzz :: Int -> String
fizzBuzz n = if (n `mod` 3 == 0 && n `mod` 5 == 0) then "fizzbuzz" 
    else if (n `mod` 3 == 0) then "fizz"
    else if (n `mod` 5 == 0) then "buzz"
    else show n

-- If can be assigned to variables
yyy = if (5 > 3) then "hello" else "goodbye"

-- * Case syntax
-- Execute a specific block of code based on a variable's value
-- case <Exp> of <Pattern1> -> <Result1>
--               <Pattern1> -> <Result1>
--               <Pattern1> -> <Result1>

-- The default/catchall value can use any word. _else in this case:
yesterday' :: Day -> Day
yesterday' day = case day of 
    "M" -> "Su"
    "Tu" -> "M"
    "W" -> "Tu"
    "Th" -> "W"
    "F" -> "Th"
    "Sa" -> "F"
    "Su" -> "Sa"
    _else -> "Error!"

choosepokemon_case :: Power -> Pokemon
choosepokemon_case p = case p of
  "Grass" -> "Bulbasaur"
  "Fire" -> "Charmander"
  "Water" -> "Squirtle"
  end -> "pikachu"

fizzBuzz' :: Int -> String
fizzBuzz' n = case (n `mod` 3 == 0, n `mod` 5 == 0) of
    (True, True) -> "fizzbuzz"
    (True, False) -> "fizz"
    (False, True) -> "buzz"
    (False, False) -> show n 

checkForZeroes :: (Int, Int, Int) -> String
checkForZeroes tuple3 = case tuple3 of
                          (0, _, _) -> "The first one is a zero!"
                          (_, 0, _) -> "The second one is a zero!"
                          (_,_,0) -> "The third one is a zero"
                          _ -> "Please provide a tuple of"

-- You can do most of the same things using pattern matching, but case statements have the advantage they can be used anywhere an expression can: 
checkForZeros' :: (Int, Int, Int) -> String
checkForZeros' tuple3 = "The " ++ show tuple3 ++ " has " ++
    case tuple3 of
        (0, _, _) -> "a zero as its first element"
        (_, 0, _) -> "a zero as its second element"
        (_, _, 0) -> "a zero as its third element"
        _  -> "no zeroes!"
checkzeros = checkForZeros' (32,0,256)

-- Case can be assigned to variables
x = case (2 + 3) of 
    5 -> "Correct"
    _ -> "Wrong"
    
-- Case can be passed into functions
caseLen = length $ x

and' :: Bool -> Bool -> Bool
and' x y 
    | x == True && y == True = True
    | otherwise = False


-- * Guard syntax
-- Guards have similar to properties to if/else, but they are suited for when there are many conditions. 
-- You can create a catchall condition using otherwise. Otherwise is literally just True, which is another way to set up a catchall. You could also just put True instead of otherwise to set up a value. 

-- func arg
--   | <Condition1> = <Result1>
--   | <Condition2> = <Result2>
--   | <Cordition3> = <Result3>
--   | otherwise = <Result4>
yesterday :: Day -> Day
yesterday x 
    | x == "M" = "Su"
    | x == "Tu" = "M"
    | x == "W" = "Tu"
    | x == "Th" = "W"
    | x == "F" = "Th"
    | x == "Sa" = "F"
    | x == "Su" = "Sa"
    | default 

choosepokemon_guard :: Power -> Pokemon
choosepokemon_guard p
  | p == "Grass" = "Bulbasaur"
  | p == "Fire" = "Charmander"
  | p == "Water" = "Sauirtle"
  | otherwise = "Pikachu"


birthdayCongrats :: Int -> String
birthdayCongrats age 
  | age == 1 = "Welcome to the world"
  | age > 1 && age < 35 = "Happy birthday young person"
  | age >= 35 && age < 200 = "Happy birthday"
  | otherwise = "unknown age"

fizzBuzz'' :: Int -> String
fizzBuzz'' n
    | (n `mod` 3 == 0 && n `mod` 5 == 0) = "fizzbuzz"
    | n `mod` 3 == 0 = "fizz"
    | n `mod` 5 == 0 = "buzz"
    | otherwise = show n











