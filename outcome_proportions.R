# Tuomo A. Nieminen 23.10.2016

# load the data
rivit <- read.csv2("Tilastot.csv", stringsAsFactors = FALSE)
nr <- nrow(rivit)

# create a list of tables of 1 x 2 frequencies
freqs <- apply(rivit, 1, table)

# combine the lists to a data.frame (ignore warning)
freqs <- as.data.frame(do.call(rbind, freqs))

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
legend("bottomright", legend = outcomes, col = 1:3, lty = 1, cex = 0.6, pt.cex = 1)

