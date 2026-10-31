my_function <- function(arg1, arg2) {
  # Statements involving arg1, arg2:
  cat(sprintf("Argument %s is a %s\n", as.character(arg1),
              class(arg1)))
  cat(sprintf("Argument %s is a %s\n", as.character(arg2),
              class(arg2)))

  return(c(arg1, arg2))
}

my_function(1, 2) # Test the function
my_function("riki", "Tiki") # A different test