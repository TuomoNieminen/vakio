# simuloidaan ensin havaittu aineisto (2284 riviä) N kertaa painotetuilla kotivoitto-todennäköisyyksillä

# alustetaan N x 2284 taulukko, jossa N on simulaation iteraatioiden lukumäärä, 2284 on simuloitavien rivien lukumäärä
N <- 10000
A = matrix(NA, nrow = N, ncol = 2284) 

for(i in 1:N)  {# simulaatioiden lukumäärä
  for(j in 1:2284) {# rivien lukumäärä
    # satunnainen rivi
    rivi <- sample(c("1","X","2"), replace = T, size = 13, prob = c(0.45, 0.27, 0.28))
    rivi_string <-  paste(rivi, collapse = "") # rivi yhdeksi merkkijonoksi
    A[i,j] <- rivi_string
  }
  if(i %% 100 == 0) print(paste("creating A, iter",i,"/",N))
}

# jäljellä on selvittää kuinka monessa taulukon A[i,] rivissä  esiintyy sama rivi (merkkijono) yli 2 kertaa

montako <- 0
for(i in 1:N) {
  montako <- montako + any(table(A[i,]) > 2) # esintyyko sama rivi yli 2 kertaa
  if(i %% 100 == 0) print(paste("finding duplicate rows, iter",i,"/",N))
}
               
# haluttu frekvenssi (todennäköisyys) on siis nyt
print(montako / N)