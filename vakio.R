# Aapeli Nevala 10/2016

rivit <- read.csv2("Tilastot.csv", stringsAsFactors = FALSE)
colnames(rivit) <- 1:13

x = numeric(nrow(rivit))
for (i in 1:nrow(rivit)) {
  for(j in i:nrow(rivit)) {
    if(sum(rivit[i,] == rivit[j,]) == 13) {
      x[i] = x[i] + 1
      if(i != j) {x[j] = x[j] + 1}
    }
  }
}

