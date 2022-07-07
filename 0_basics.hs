-- * GHCI commands
-- gchi to start compiler
-- ghci learn-you-a-haskell.hs to load a certain file
-- :l or :load to load a file once in GHCI
-- :r or :reload to reload a file
-- :t or :type to check type signature
-- :i or :info to check type or type class
-- :q or :quit to leave ghci
-- :? to see all commands

-- if defining a variable in ghci, use let before (ex let a = 1)

-- * Haskell Language
-- Haskell is a pure functional programming language
-- No assignment statements
-- No variables 
-- Once given a value, value never changes
-- No side effects at all, only calculate and return result
-- Haskell is lazy. Won't execute functions unless they are called.

-- Strives for modularity
-- Output will always be the same given an input
-- No concept of time
-- Reason about code with ease
-- Just follow types

-- Haskell is statically typed. Compiler knows data type of different items in code, allowing errors to be caught at compile time.
-- Haskell uses type inference, which allows it to figure out which data is which type. 
-- Haskell is elegant and concise, with programs usually shorter than imperative equivalent. Easy to maintain and less bugs.
-- Haskell is built of functions, and we compose them together to get the functionality of the program. 
-- Function without parameters is called a definition
-- ex. helloWorld = "Hello World"


-- * Functional vs Imperative
-- Imperative performs mutation of state by assignment of variables. Tell the program what to do.
-- Functional emulates mutation of state by transformation of values by applying functions. Tell the program what everything is. 


-- * Haskell compared to JS
-- No loops
-- No if 
-- Functions is a single return
-- No side effects (we can do this by separating pure functional and dirty IO)
-- No assignments within variables
-- No arrays
-- Functions can have only 0 or 1 arguments


-- * Steps when coding haskell
-- Analyse the problem
-- Divide and Conquer: Divide in smaller problems if possible
-- Consider the types
-- Consider the process (the evaluation process..)
-- Consider the identities and basecases
-- Consider the inputs
-- Code your functions


-- * Logic Operators
-- && - Boolean and
-- || - Boolean or 
-- not - negate 
-- True
-- False
-- == - equal
-- /= - not equal