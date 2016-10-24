# Tuomo A. Nieminen 23.10.2016

# According to the data, the average probability of a hometeam win ("1") is 0.45
# and the average probability of a draw or a loss are almost identical

# Here we compute the expected frequencies of rows with 0, 1, ..., 13 homewins 
# and then compare to the observed frequencies

# Expected homewins assumptions
# 1. the probability of a homewin is 0.45 for each match.
# 2. the probability of not a homewin is 0.55 for each match

# number of matches
n <- 13

# probability of home win in a given match
p <- 0.45

# expected proportions using a binomial model
homewins <- 0:13
TN <- dbinom(homewins, size = n, prob = p)

# load the data
rivit <- read.csv2("Tilastot.csv", stringsAsFactors = FALSE)
nr <- nrow(rivit)

# create a data.frame storing tables of outcome ("1", "x", "2") frequencies
freqs <- apply(rivit, 1, FUN = function(row) table(factor(row, levels = c("1","X","2"))))
freqs <- as.data.frame(t(freqs))

# observed frequencies of 0, 1, .., 13 homewins
observed <- sapply(homewins, FUN = function(wins) sum(freqs[["1"]]==wins))

# expected frequencies
expected <- round(TN*nr)

# combine
cbind(expected, observed)
