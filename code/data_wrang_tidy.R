# data_wrang_tidy.R: Pound Hill wrangling with dplyr and tidyr
# Run from the project root: Rscript code/data_wrang_tidy.R

suppressPackageStartupMessages({
  library(dplyr)
  library(tidyr)
})

MyData <- as.matrix(read.csv("data/pound_hill_data.csv", header = FALSE))
MyMetaData <- read.csv("data/pound_hill_meta_data.csv", header = TRUE, sep = ";")

head(MyData)
dim(MyData)
MyData <- t(MyData)
MyData[MyData == ""] <- 0

TempData <- as.data.frame(MyData[-1, ], stringsAsFactors = FALSE)
colnames(TempData) <- MyData[1, ]

MyWrangledData <- TempData |>
  pivot_longer(
    cols = -c(Cultivation, Block, Plot, Quadrat),
    names_to = "Species",
    values_to = "Count"
  ) |>
  mutate(
    across(c(Cultivation, Block, Plot, Quadrat, Species), as.factor),
    Count = as.integer(Count)
  ) |>
  as_tibble()

glimpse(MyWrangledData)
dim(MyWrangledData)

MyWrangledData |>
  group_by(Species) |>
  summarise(avg = mean(Count)) |>
  arrange(desc(avg)) |>
  head()