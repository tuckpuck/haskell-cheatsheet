-- * GHCI commands
-- gchi to start compiler
-- ghci learn-you-a-haskell.hs to load a certain file
-- :l or :load to load a file once in GHCI
-- :r or :reload to reload a file
-- :t or :type to check type signature
-- :i or :info to check type or type class
-- :k or :kind is the type of the type
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

-- Haskell is a single assignment language - This means variables cannot change once set
-- Because of this 'variables' are technically called identifiers
-- Setting an identifier is called binding instead of assigning


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


-- * Tools and Ecosystem
-- GHCup is the Installer for Haskell tools 
-- HLS is the Haskell Language Server. In VS Code this is built into the Haskell plug-in
-- You can create a new project using cabal, stack, or summoner
-- You can build using 'cabal build' or 'stack build'
-- Packages are defined in .cabal file
-- Stackage provides sets of Haskell packages that are known to build together. LTS is the recommended version, Nightly is one version ahead of that.
-- Hackage is the repository of Haskell packages and their documentation

-- * Haskell compilers
-- GHC from Glasgow. This is the de facto standard
-- Helium and UHC from Utrecht
-- Mu used internally
-- LHC, JHC are not maintained 

-- * Haskell Standard
-- Current standard is Haskell 2010
-- Previous standard was Haskell 98

-- * Extensions
-- Extensions are added first thing in the file
-- They look like this: {-# language MultiParamTypeClasses #-}
-- Some are defined as stable by the GHC steering committee
-- These include: 
-- Syntactical goodies
-- Type classes with multiple params
-- Type families
-- More ways to use deriving
-- Many more...

-- * Main Players
-- GHC Team, who builds the compiler
-- Haskell Foundation, who promotes Haskell
-- Haskell Language Server team
-- Several working groups: Haskell.org, Core Library Committee, GHC steering committee

-- * Lazy Evaluation
-- Lazy evaluation ensures that expressions are only evaluated when they are needed. 
-- Lazy eval combines normal order evaluation and sharing. Function arguments are not evaluated until it is needed in the body of a function. Pattern matching determines when the arguments are needed.
-- Normal order evaluation means evaluation happens from the outermost function to the innermost function. Other languages like JS and C use Applicative-Order Evaluation, which evaluates innermost to outermost. If an expression is reducible to a value, both methods will give the same result.
-- Sharing is the practice of temporarily storing or memoizing results in normal order eval to avoid repeat computation.
-- For example, due to lazy evaluation the expression fst (2, [1..]) will never touch the infinite loop. Only the 2 is necessary.


