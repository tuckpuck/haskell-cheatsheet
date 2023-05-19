-- * Native Char Functions
-- Text to lists and lists to text
-- Words is used to break up a string to list of words
wordsExample = words "To be or not to be" --["To","be","or","not","to","be"]

-- Unwords joins a list of words with separating spaces
unwordsExample = unwords ["To","be","or","not","to","be"] --"To be or not to be"

-- Lines splits the argument into a list of lines with newline (\n) characters
linesExample = lines "How are you? \n I'm fine, how about you?" --["How are you? "," I'm fine, how about you?"]

-- Unlines creates a String from list of Strings by appending  newline (\n) characters. 
unlinesExample = unlines ["How are you?","I'm fine, how about you?"] --"How are you?\nI'm fine, how about you?\n"