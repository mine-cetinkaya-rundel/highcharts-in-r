library(dlplyr)

# Load both data files ----------------------------------------------

d1 <- read.csv("US_births_1994-2003_CDC_NCHS.csv")
d2 <- read.csv("US_births_2000-2014_SSA.csv")

# Check that the overlapping yrs agree ------------------------------

d1_2000_2003 <- d1 %>%
  filter(between(year, 2000, 2003))

d2_2000_2003 <- d2 %>%
  filter(between(year, 2000, 2003))

all.equal(d1_2000_2003, d2_2000_2003) # FALSE, use SSA data

# Merge datasets, use SSA data for overlapping years ----------------

d1_1994_1999 <- d1 %>%
  filter(between(year, 1994, 1999))

d <- rbind(d1_1994_1999, d2)

# Save file ---------------------------------------------------------

write.csv(d, file = "births.csv", row.names = FALSE)


