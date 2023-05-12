-- * Native Integral Functions
-- Addition
addition a b = a + b

-- Subtraction
subtraction = 10 - 5 --5

-- Multiplication
multiplication = 10 * 5 --50

-- Div is the division function. This function Returns how many times the first number can be divided by the second one, and gets rid of any remainder. 
-- If you want division that produces a Float instead, use "/" instead. 
division = 10 `div` 3 --3

-- Mod - mod gets the remainder after a division
modulus = 10 `mod` 3 --1

-- Exponentiation - The '^' operator takes an Integral b and Num a, and returns a Num.
exponentiation = 3 ^ 3 --27

-- Minimum - takes 2 parameters, returns the smaller one
findMin = min 111 222 --111

-- Maximum - takes 2 parameters, returns the larger one
findMax = max 111 222 --222

-- GCD - finds the greatest common  integer that both be divided by evenly.
findGCD = gcd 25 310 --5

-- LCM - finds the lowest common integer that both multiply into evenly.
findLCM = lcm 5 11 --55

-- successor - takes a parameter and returns the next number up
findSuccessor = succ 10 --11

-- abs - returns the absolute value, which is positive rather than negative.
getAbs = abs (-10) --10
getAbs' = abs (10) --10

-- negate - returns the opposite of the value given, whether positive or negative.
negateValue = negate (10) --(-10)
negateValue' = negate (-10) --(10)

-- even - test whether an Integer value is even.
isEven = even 10 --True
-- odd - test whether an Integer value is odd.
isOdd = odd 10 --False