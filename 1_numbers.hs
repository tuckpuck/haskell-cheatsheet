-- * Numbers and Native Functions
-- If using a negative number, surround it in parenthesis 
-- (-3)


-- succ - successor function, takes a parameter and returns the next number up
findSuccessor = succ 10 --11
-- min - takes 2 parameters, returns the smaller one
findMinimum = min 111 222 --111
-- max - takes 2 parameters, returns the larger one
findMaximum = max 111 222 --222
-- div - takes two integers and executes an integral division. Returns how many times the first number can be divided by the second one
divisionMod = 92 `div` 10 --9
-- Use standard divide operator to get a fractional return
divisionExact = 92 / 10 --9.2