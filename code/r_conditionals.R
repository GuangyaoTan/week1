# r_conditionals.R: R functions that use conditionals

# Checks if an integer is even
is.even <- function(n = 2) {
  if (n %% 2 == 0) {
    return(paste(n, "is even!"))
  } else {
    return(paste(n, "is odd!"))
  }
}

# Checks if a number is a power of 2
is.power2 <- function(n = 2) {
  if (log2(n) %% 1 == 0) {
    return(paste(n, "is a power of 2!"))
  } else {
    return(paste(n, "is not a power of 2!"))
  }
}

# Checks if a number is prime
is.prime <- function(n) {
  if (n == 0) {
    return(paste(n, "is a zero!"))
  } else if (n == 1) {
    return(paste(n, "is just a unit!"))
  } else if (n == 2) {  # added: 2:(n-1) is c(2, 1) when n is 2
    return(paste(n, "is a prime!"))
  }

  ints <- 2:(n - 1)

  if (all(n %% ints != 0)) {
    return(paste(n, "is a prime!"))
  } else {
    return(paste(n, "is a composite!"))
  }
}

print(is.even(6))
print(is.power2(4))
print(is.prime(3))
print(is.prime(2))