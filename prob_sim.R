# Tuomo A. Nieminen 23.10.2016

# simulate the probability P(three or more identical rows)
# ---------------------------------------

# load the data (to get the  number of rows)
rivit <- read.csv2("Tilastot.csv", stringsAsFactors = FALSE)

# the size of the simulation
simsize <- 1e4

# unique integers represent unique combinations of rows
unique_rows <- 1:(3^13)

# a single simulation iteration is a sample of <n> rows
n <- nrow(rivit) # 2284

# create an empty data.frame to store the simulated integer vectors as rows
df <- matrix(NA, nrow = simsize, ncol = n)

# draw a sample of <n> from the unique rows with replacement
# repeat <simsize> times and store the sampled integers
for(i in 1:simsize) df[i, ] <- sample(unique_rows, size = n, replace = T)

# for each row, check if there are more than 2 of the same integer (this might be slow)
results <- apply(df, 1, FUN = function(v) any(table(v)>2))

# compute the proportion of true cases
ptwoormore <- sum(results)/simsize
