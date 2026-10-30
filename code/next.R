# next.R: skip to the next iteration; prints only odd numbers
for (i in 1:10) {
  if ((i %% 2) == 0) {  # check if the number is even
    next                # skip to next iteration of loop
  }
  print(i)
}