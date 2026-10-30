
# observations_practice.R: summarise observations by site
# Run from the project root: Rscript code/observations_practice.R

read_observations <- function(path) {
  obs <- read.csv(
    path,
    colClasses = "character",
    na.strings = character(0)
  )

  if (!identical(names(obs), c("site", "date", "count"))) {
    stop("Columns must be exactly: site, date, count")
  }

  if (any(obs$site == "") || any(obs$date == "")) {
    stop("Every row needs a site and a date")
  }

  # Empty strings represent missing counts
  known <- obs$count != ""

  # Known counts must be non-negative integers
  bad <- known & !grepl("^(0|[1-9][0-9]*)$", obs$count)

  if (any(bad)) {
    stop(
      "Counts must be empty or non-negative integers; invalid: ",
      paste(obs$count[bad], collapse = ", ")
    )
  }

  obs$count[!known] <- NA
  obs$count <- as.integer(obs$count)

  return(obs)
}

# Summarise observations by site
summarise_observations <- function(data) {

  # Remove exact duplicate observations
  data <- unique(data)

  # Get all site names in alphabetical order
  sites <- sort(unique(data$site))

  # Create the results table
  result <- data.frame(
    site = sites,
    total_known = rep(NA_integer_, length(sites)),
    missing_count = integer(length(sites))
  )

  # Calculate totals and missing counts for each site
  for (i in seq_along(sites)) {

    counts <- data$count[data$site == sites[i]]

    # Number of missing observations
    result$missing_count[i] <- sum(is.na(counts))

    # Keep NA if all counts are missing
    # Otherwise sum the known observations
    if (!all(is.na(counts))) {
      result$total_known[i] <- sum(counts, na.rm = TRUE)
    }
  }

  return(result)
}

#Checks

check_site <- function(res, s, total, missing) {

  row <- res[res$site == s, ]

  stopifnot(
    nrow(row) == 1,
    row$missing_count == missing
  )

  if (is.na(total)) {
    stopifnot(is.na(row$total_known))
  } else {
    stopifnot(
      !is.na(row$total_known),
      row$total_known == total
    )
  }
}

# Read and summarise the datasets
ordinary <- summarise_observations(
  read_observations("data/bootcamp_observations.csv")
)

boundary <- summarise_observations(
  read_observations("data/bootcamp_observations_boundary.csv")
)

# Check expected results
check_site(ordinary, "A", 2, 1)
check_site(ordinary, "B", 0, 0)
check_site(boundary, "C", NA, 2)
check_site(boundary, "D", 0, 0)

# Verify that invalid counts are rejected
bad_result <- try(
  read_observations("data/bootcamp_observations_invalid.csv"),
  silent = TRUE
)

stopifnot(
  inherits(bad_result, "try-error"),
  grepl(
    "-1",
    conditionMessage(attr(bad_result, "condition")),
    fixed = TRUE
  )
)

#Report and figure

# Combine the summaries
summary_table <- rbind(ordinary, boundary)

print(summary_table)

# Create results directory if necessary
dir.create("results", showWarnings = FALSE)

# Save the figure
pdf(
  "results/observations_known_totals.pdf",
  width = 6,
  height = 4
)

# Use zero-height bars for sites with unavailable totals
heights <- ifelse(
  is.na(summary_table$total_known),
  0,
  summary_table$total_known
)

bp <- barplot(
  heights,
  names.arg = summary_table$site,
  ylim = c(0, max(heights) + 1),
  xlab = "Site",
  ylab = "Known-count total",
  main = "Known-count totals by site",
  sub = "NA = every count missing (total unavailable, not zero)"
)

# Display NA explicitly instead of incorrectly showing zero
text(
  bp,
  heights,
  labels = ifelse(
    is.na(summary_table$total_known),
    "NA",
    summary_table$total_known
  ),
  pos = 3
)

invisible(dev.off())
