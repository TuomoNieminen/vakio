



# P(three or more identical rows)

These codes are also found in prob_sim.R


```r
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
sum(results)/simsize
```

```
## [1] 6e-04
```


# Cumulative proportions

These codes are also found in outcome_proportions.R


```r
# Tuomo A. Nieminen 23.10.2016

# load the data
rivit <- read.csv2("Tilastot.csv", stringsAsFactors = FALSE)
nr <- nrow(rivit)

# create a data.frame storing tables of outcome ("1", "x", "2") frequencies

freqs <- apply(rivit, 1, FUN = function(row) table(factor(row, levels = c("1","X","2"))))
freqs <- as.data.frame(t(freqs))

# compute cumulative frequencies
cum_freqs <- cumsum(freqs)

# compute cumulative proportions
cum_prop <- cum_freqs / cumsum(rep(13, nr))

# draw an empty plot
plot(1:nr, 
     main = "Cumulative proportions of match outcomes
     Vakioveikkaus data 37/1972 - 40/2016",
     ylab = "cumulative proportion", 
     xlab = "week",
     type = "n", ylim = c(0, 0.5))

# plot the cumulative proportions
for(i in 1:3) {
  lines(1:nr, cum_prop[, i], col = i) 
}

# add a legend to the plot
outcomes <- names(cum_prop)
outcomes <- paste0(outcomes, " (", round(100*cum_prop[nr, ],0), "%)")
legend("bottomright", legend = outcomes, col = 1:3, lty = 1)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

# Frequencies of 0, 1, .., 13 homewins


```r
# According to the data, the average probability of a hometeam win ("1") is 0.45
# and the average probability of a draw or a loss are almost identical

# Here we compute the expected frequencies of rows with 0, 1, ..., 13 homewins 
# and then compare to the observed frequencies

# Expected homewins assumptions
# 1. the probability of a homewin is 0.45 for each match.
# 2. the probability of not a homewin is 0.55 for each match


# objects freqs and nr are available

# number of matches
n <- 13

# probability of home win in a given match
p <- 0.45

# expected proportions using a binomial model
homewins <- 0:13
TN <- dbinom(homewins, size = n, prob = p)

# observed frequencies of 0, 1, .., 13 homewins
observed <- sapply(homewins, FUN = function(wins) sum(freqs[["1"]]==wins))

# expected frequencies
expected <- round(TN*nr)

# combine
cbind(expected, observed)
```

```
##       expected observed
##  [1,]        1        2
##  [2,]       10       10
##  [3,]       50       47
##  [4,]      151      142
##  [5,]      308      330
##  [6,]      454      427
##  [7,]      495      484
##  [8,]      405      411
##  [9,]      249      252
## [10,]      113      125
## [11,]       37       39
## [12,]        8       13
## [13,]        1        2
## [14,]        0        0
```

