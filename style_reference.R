## R STYLE REFERENCE
## FOR PROPER, EASILY READABLE AND DEBUGGABLE CODE

# Below are some recommendations and guidelines for
# Writing R code, that is easily trackable and comprehensible
# By yourself and your collaborators
# That minimizes errors while writing
# Or facilitates finding errors/bugs when the code does not work as intended

# Note that some of the errors you make, renders the code unsourcable by the R interpreter at first hand
# Syntax errors are such kind of errors
# They are easier to spot

# Some of the codes do not hinder R interpreter to source the code
# They are not syntax errors
# But they appear when you run the function
# Sometimes they make the R interpreter throw an error - e.g. in the case of referencing a non-existing variable
# Or worse, the code runs without throwing an error but does not yield the expected output!
# For example assigning a wrong a value to a variable
# These are harder to spot and corrent
# So please pay attention to these style guidelines
# So that you minimize errors


# select a self-explanatory name for your function
# you may briefly explain its intent with a comment line above
# note that, for complex variable names incorporating multiple words, separate them with an underscore "_", not a dot "."
# Dot has a special meaning in the context of object oriented programming
largest_prime_factor <- function(number = 1000) # or you can write a comment at the end of the line
# but it is better not the enlarge the reading span of your code: So extend your code vertically, not horizontally
# it is better to have more lines, but not have longer lines
# select self explanatory names for your arguments
# and put spaces after commas separating the arguments, and spaces before and after equal signs (=) that introduce default values for arguments
# use curly braces to delimit blocks for functions, loops and condititonals
# it is best to put opening and closing curly braces in separate lines just below the line initiating the block and leave them alone
# so that you can track the blocks that you open and close easier
# in a well written code, the opening and closing curly braces for a block are on the same indent level
{ # the curly brace that introduces the outermost block for the function should be at the beginning of the line, with no leading indents
    
# introduce an indent for each lower level block that you initiate inside a larger block
# a level of indent should be introduced by a tab, not single spaces

    # put breathing spaces inside a line:
    # put a space after control structure identifiers like "for", "while" or "if"
    # select self explanatory variable names that you introduce in your code
    # make sure that they do not coincide with built-in function, operator or constant names in R
    # and make sure that in each "for" or "while" loop, you introduce a variable name that was not previously used inside the function
    # and make sure not to refer to global variable: variables outside the scope of your function (e.g. variables that were introduced before you started your function)
    # if you have to use those global variables, pass them using arguments of your function
    for (factorx in 2:sqrt(number)) # for1: you can enumerate nested "for" or "while" loops as such: for1, for2, etc, to better track them
    {

        # it is better to put an empty line before and after the blocks to delimit them from the rest of the code
        # this makes the code more readable and blocks more identifiable
        # please put a white space before and after operators such as "%%", "==", "&", "|", "!="
        while (number %% factorx == 0) # while1, again you can enumerate the loops
        {
            # put a space before and after assignment operator "<-"
            # try to do just one thing in a line, don't stuff a line with multiple functions if you can divide them across lines
            number <- number / factorx
            
            # again, wrap your code with empty lines for easier reading
            if (number == 1) # if1: enumarate your conditional statements to track nested ones
            # always separate lines after a control struct (for, while, if, etc) delimiting with curly braces
            {
                # when you want your code to return a value and stop, then use "return" function
                # print just prints a value, not returns something to be used for subsequent processess or stops the code
                return(factorx)
            } # close if1: put a small comment like this for closing braces, so that you better track your code blocks
            # see that closing brace for if1 is at the same indent with the if statement and the opening brace
            # if you don't want your code to do anyting when a condition is FALSE
            # don't put an "else" statement
            # but if you need a code to be executed when the condition is FALSE
            # delimit it like that:
            # else
            # {
            # some code to be executed when the condition is false
            # }

        } # close while1: see, you have limited chance to make a mistake opening and closing your blocks with curlies this way
     
     } # close for1: see that the indent level of the closing brace is the same as the for statement and the opening brace
    
    # your code should return a single object before you close the last curly brace
    # even if it is not expected to return anything but stop there
    # put return()    
    return(number)

} # see the outmost curly brace that delimits the function block is at the beginning of the line, with no leading indents

