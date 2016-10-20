
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

# simuloidaan P(kolme tai yli samaa riviä)
riveja <- 1:(3^13)
simsize <- 1e5
n <- nrow(rivit)

df <- matrix(NA, nrow = simsize, ncol = n)
for(i in 1:simsize) df[i, ] <- sample(riveja, size = n, replace = T)

results <- apply(df, 1, FUN = function(v) any(table(v)>2))
sum(results)/length(results)
