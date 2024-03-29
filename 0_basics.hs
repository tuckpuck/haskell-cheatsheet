-- * GHCI commands
-- ghci is an interactive command line environment or a REPL, in which Haskell expressions can be interactively evaluated and programs can be interpreted. 
-- run `gchi` to start compiler
-- run `ghci learn-you-a-haskell.hs` to load a certain file
-- :l or :load to load a file once in GHCI
-- :r or :reload to reload a file
-- :t or :type to check type signature
-- :i or :info to check type or type class
-- :k or :kind is the type of the type
-- :q or :quit to leave ghci
-- :? to see all commands

-- * Haskell as a pure language
-- Haskell is a pure functional programming language.
-- Pure functions depend only on their provided arguments, not any global or local state
-- If given the same input they will always produce the same output
-- Functions are modular and have no side effects
-- These properties make code less error prone
-- Modularity makes parallel or concurrent computing easier because functions can't interfere with one another
-- To allow for side effects such as network communication or I/O, you can tag it as IO in the type system

-- * Haskell as a lazy language
-- Lazy evaluation ensures that expressions and arguments are only evaluated when they are needed
-- Normal order evaluation means evaluation happens from the outermost function to the innermost function. Other languages like JS and C use Applicative-Order Evaluation, which evaluates innermost to outermost. If an expression is reducible to a value, both methods will produce the same result
-- Sharing is the practice of temporarily storing or memoizing results in normal order eval to avoid repeat computation
-- For example, due to lazy evaluation the expression fst (2, [1..]) will never touch the infinite loop

-- * Other properties of Haskell
-- Haskell is a general purpose language with many programs written in it
-- Haskell is of the older programming languages, development began in 1987. First major version was released in 1998. 2010 is the latest version. Haskell foundation continues to add features and maintain the language 
-- Haskell is statically typed. This means that code and types are checked at compile-time. Compiler knows data type of different items in code, allowing errors to be caught when compiled. 
-- For data that isn't explicitly given a type, Haskell uses type inference, which allows it to infer the types of data
-- Automatic memory management
-- No concept of time
-- Named after Haskell Curry to honor his work in Lambda calculus 

-- * Evaluating expressions vs code compilation
-- Expression is a piece of code that can be evaluated into a value. Just because it is evaluated does not mean it is compiled
-- When code is compiled, it is optimized into a binary or assembly code that is most easily run by the processor. Problems will be caught at this compilation step. 

-- * Haskell programs
-- Haskell is built of functions, and we compose them together to get the functionality of the program
-- Function composition means taking the result of one function and giving it to the next

-- * Functional vs Imperative
-- Imperative performs mutation of state by assignment of variables. Tell the program what to do
-- Functional emulates mutation of state by transformation of values by applying functions. Tell the program what everything is 

-- * Haskell compared to JS
-- Haskell has no loops, instead recursion is used
-- Haskell has no arrays, instead lists offer some of the same features 
-- Haskell functions give a single return value without side effects. In Haskell pure functional and "dirty" IO are separated
-- Haskell functions can have only 0 or 1 arguments, though having more arguments are mimicked through currying, or by passing a list or tuple of values
-- Haskell definitions cannot be changed, the are constant. JS variables are often made to change
-- In Haskell, every value has a type and the type of the value cannot change
-- Haskell programs usually shorter than imperative equivalent 
-- Haskell is easier to maintain, reason about code, and less bugs
-- Haskell is statically typed, meaning it checks code at compile-time. JS is dynamically typed, meaning it checks code at run-time

-- * Comments
-- Comments are created using `--` before the comment

{-
Multi-line
comments are created
using {- and -}
-}

-- * Indentation 
-- Haskell is indentation sensitive. Spaces, tabs, and newlines matter
-- Each nested expression should be indented one tab further

-- * Steps when coding haskell
-- Analyze the problem
-- Divide and Conquer: Divide in smaller problems if possible
-- Consider the types
-- Consider the process (the evaluation process..)
-- Consider the identities and base cases
-- Consider the inputs
-- Code your functions

-- * Tools and Ecosystem
-- GHCup is the Installer for Haskell tools 
-- HLS is the Haskell Language Server. In VS Code this is part of the Haskell plug-in

-- * Haskell Resources
-- https://hoogle.haskell.org is used for searching functions and exploring libraries.

-- * Haskell package managers
-- You can create a new project using cabal, stack, or summoner
-- You can build using 'cabal build' or 'stack build'
-- Packages are defined in .cabal file
-- Stackage provides sets of Haskell packages that are known to build together. LTS is the recommended version, Nightly is one version ahead of that
-- Hackage is the repository of Haskell packages and their documentation

-- * Haskell compilers
-- GHC from Glasgow. This is the de facto standard
-- Helium and UHC from Utrecht
-- Mu used internally
-- LHC, JHC are not maintained

-- * Haskell standard
-- Current standard is Haskell 2010
-- Previous standard was Haskell 98

-- * Imports
-- The 'prelude' library is loaded automatically. It is the essential collection of commonly used functions, types, and type classes that are used extensively in Haskell programming.
-- To use other libraries, you need to have them installed on your system. You can use tools like Cabal or Stack to manage your Haskell dependencies and install libraries.
-- To find packages to use, look on https://hackage.haskell.org/packages/browse. 

-- To import other libraries into your Haskell program, you need to use the `import` keyword followed by the name of the library. Here is the general syntax:
-- import <LibraryName>

-- As a specific example, if you want to import the Data.List module from the base library, you would write:
-- import Data.List

-- If you want to import a specific function or type from a library, you can specify it using the `()` syntax. For example, to import only the `sort` function from Data.List, you would write:
-- import Data.List (sort)

-- If you want to import multiple functions or types from a library, you can separate them with commas. For example, to import both `sort` and `group` functions from Data.List, you would write:
-- import Data.List (sort, group)

-- If you want to import a library with a qualified name, meaning that you need to prefix the imported functions or types with the library name, you can use the `qualified` keyword. For example, to import the Data.Map library with a qualified name, you would write:
-- import qualified Data.Map
-- Then, you can access functions or types from Data.Map by prefixing them with `Data.Map`, like `Data.Map.lookup`.

-- You can also import a library with a different name using the `as` keyword. For example, to import the Data.Map library with a different name `Map`, you would write:
-- import qualified Data.Map as Map

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

-- * Main Players in Haskell ecosystem
-- GHC Team, who builds the compiler
-- Haskell Foundation, who promotes Haskell
-- Haskell Language Server team
-- Several working groups: Haskell.org, Core Library Committee, GHC steering committee