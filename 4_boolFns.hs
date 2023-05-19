-- * Native Boolean Functions
-- Logic operators return Booleans 

-- * Logic Operators
-- && - Boolean and. Returns True if both the boolean to its left and right are True
-- || - Boolean or. returns True if either one of them is True
-- not - negate 
-- True
-- False
-- == - equal
-- /= - not equal

-- && aka the and operator
logicalAnd = True && False --False
andFalse x = x && False

-- || aka the or operator
logicalOr = True || False --True
orFalse x = x && False

-- not will negate a value
logicalNot = not True --False
flipBool x = not x

-- Check for equality
equalTo = 10 == 10 --True
equalTo18 x = x == 18

-- Check for non equality 
notEqualTo = 10 /= 10 --False
notEqualTo18 x = x /= 18

-- Less than
lessThan = 10 < 11 --True 
lessThan18 x = x < 18

-- Less than or equal to
lessOrEqual = 10 <= 10 --True
lessOrEqualTo18 x = x <= 18

-- Greater than
greaterThan = 10 > 4 --True
greaterThan18 x = x > 18

-- Greater than or equal to
greaterOrEqual = 10 >= 10 --True
greaterOrEqualTo18 x = x >= 18