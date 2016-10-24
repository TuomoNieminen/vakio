# number of matches
n <- 13

# probability of home win in a given match
p <- 0.45

# probabilities of rows as a function of home_wins
home_win <- 0:13
TN <- dbinom(home_win, size = n, prob = p)

# plot the probabilities
barplot(height =  TN, names = kotivoitot, ylim = c(0, 0.3), 
        main = "Rivien todennäköisyydet esiintyvien kotivoittojen suhteen")
text(kotivoitot*1.25 + 0.5, TN , labels = round(TN, 2), pos = 3)
