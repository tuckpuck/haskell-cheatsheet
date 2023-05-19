-- * Native Fractional Functions
-- Standard / divide operator produces a fractional return
divisionExact = 92 / 10 --9.2

-- sqrt takes a number of type a and returns its square root. The type provided must be must be an instance of the Floating class, which includes Float and Double.
getSqrt = sqrt 4.0

-- log takes a number of type a and returns its natural logarithm. The type a must be an instance of the Floating class.
getLog = log 10.0

-- exp takes a number of type a and returns its exponential function. The type a must be an instance of the Floating class.
getExp = exp 1.0

-- sin takes an angle in radians of type a and returns its sine value. The type a must be an instance of the Floating class. 
getSine = sin (pi / 2)

-- cos takes an angle in radians of type a and returns its cosine value. The type a must be an instance of the Floating class. 
getCos = cos pi

-- tan takes an angle in radians of type a and returns its tangent value. The type a must be an instance of the Floating class. 
getTan = tan (pi / 4)

-- fromRational takes a rational number of type Rational and converts it to a fractional number of type a. The type a must be an instance of the Fractional class, which includes Float and Double.
toFractionalFromRational = fromRational (22 / 7) :: Double

-- fromIntegral takes an integral number of type a and converts it to a numeric value of type b. The type b must be an instance of the Num class, which includes Float, Double, and Rational.
toFractionalFromIntegral = fromIntegral (10 :: Int) / 3 :: Float

-- pi constant represents the value of pi. It is an instance of the Floating class.
getPi = pi

-- Some other fractional functions are atan (inverse tangent), asin (inverse sin), and acos (inverse cosine).