# browse.R: debugging with browser()
# Interactive check: start R in the project root, run source("code/browse.R"),
# then use ls(), n, c, Q at the Browse[1]> prompt.

Exponential <- function(N0 = 1, r = 1, generations = 10) {
  # runs a simulation of exponential growth
  # returns a vector of length generations

  N <- rep(NA, generations)  # Creates a vector of NA

  N[1] <- N0
  for (t in 2:generations) {
    N[t] <- N[t - 1] * exp(r)
    if (interactive()) browser()  # breakpoint only in an interactive session
  }
  return(N)
}

growth <- Exponential()
if (!interactive()) pdf(NULL)
plot(growth, type = "l", main = "Exponential growth")
print(growth)