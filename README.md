



# Basic stats


```r
rivit <- read.csv2("Tilastot.csv", stringsAsFactors = FALSE)
nrow(rivit)
```

```
## [1] 2284
```

```r
table(do.call(c,rivit))
```

```
## 
##     1     2     X 
## 13464  8310  7918
```


# Cumulative proportions

Cumulative proportions of 1, X and 2 outcomes


```r
source("outcome_proportions.R")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

# Frequencies of 0, 1, .., 13 homewins

According to the data, the proportion of hometeam wins ("1") is 0.45 and the proportions of draws and losses are almost identical.  

Here we compute the expected frequencies of rows with 0, 1, ..., 13 homewins and then compare to the observed frequencies.  

Expected homewins assumption: the probability of a homewin is 0.45 for each match.


```r
source("homewins.R")
```

```
##    expected observed
## 0         1        2
## 1        10       10
## 2        50       47
## 3       151      142
## 4       308      330
## 5       454      427
## 6       495      484
## 7       405      411
## 8       249      252
## 9       113      125
## 10       37       39
## 11        8       13
## 12        1        2
## 13        0        0
```

# P(three or more identical rows)

The data included three of the same rows, which should be somewhat unlikely because there are 


```r
3^13
```

```
## [1] 1594323
```

unique possible rows.

The probability of observing three or more identical rows during the years included in the data was therefore simulated. 

In this simulation, we take into account that a homewin outcome is more probable than other outcomes. Therefore the distribution of rows is skewed toward rows with homewins.


```r
source("p_morethan2identical.R")
```

```
## [1] "creating A, iter 100 / 10000"
## [1] "creating A, iter 200 / 10000"
## [1] "creating A, iter 300 / 10000"
## [1] "creating A, iter 400 / 10000"
## [1] "creating A, iter 500 / 10000"
## [1] "creating A, iter 600 / 10000"
## [1] "creating A, iter 700 / 10000"
## [1] "creating A, iter 800 / 10000"
## [1] "creating A, iter 900 / 10000"
## [1] "creating A, iter 1000 / 10000"
## [1] "creating A, iter 1100 / 10000"
## [1] "creating A, iter 1200 / 10000"
## [1] "creating A, iter 1300 / 10000"
## [1] "creating A, iter 1400 / 10000"
## [1] "creating A, iter 1500 / 10000"
## [1] "creating A, iter 1600 / 10000"
## [1] "creating A, iter 1700 / 10000"
## [1] "creating A, iter 1800 / 10000"
## [1] "creating A, iter 1900 / 10000"
## [1] "creating A, iter 2000 / 10000"
## [1] "creating A, iter 2100 / 10000"
## [1] "creating A, iter 2200 / 10000"
## [1] "creating A, iter 2300 / 10000"
## [1] "creating A, iter 2400 / 10000"
## [1] "creating A, iter 2500 / 10000"
## [1] "creating A, iter 2600 / 10000"
## [1] "creating A, iter 2700 / 10000"
## [1] "creating A, iter 2800 / 10000"
## [1] "creating A, iter 2900 / 10000"
## [1] "creating A, iter 3000 / 10000"
## [1] "creating A, iter 3100 / 10000"
## [1] "creating A, iter 3200 / 10000"
## [1] "creating A, iter 3300 / 10000"
## [1] "creating A, iter 3400 / 10000"
## [1] "creating A, iter 3500 / 10000"
## [1] "creating A, iter 3600 / 10000"
## [1] "creating A, iter 3700 / 10000"
## [1] "creating A, iter 3800 / 10000"
## [1] "creating A, iter 3900 / 10000"
## [1] "creating A, iter 4000 / 10000"
## [1] "creating A, iter 4100 / 10000"
## [1] "creating A, iter 4200 / 10000"
## [1] "creating A, iter 4300 / 10000"
## [1] "creating A, iter 4400 / 10000"
## [1] "creating A, iter 4500 / 10000"
## [1] "creating A, iter 4600 / 10000"
## [1] "creating A, iter 4700 / 10000"
## [1] "creating A, iter 4800 / 10000"
## [1] "creating A, iter 4900 / 10000"
## [1] "creating A, iter 5000 / 10000"
## [1] "creating A, iter 5100 / 10000"
## [1] "creating A, iter 5200 / 10000"
## [1] "creating A, iter 5300 / 10000"
## [1] "creating A, iter 5400 / 10000"
## [1] "creating A, iter 5500 / 10000"
## [1] "creating A, iter 5600 / 10000"
## [1] "creating A, iter 5700 / 10000"
## [1] "creating A, iter 5800 / 10000"
## [1] "creating A, iter 5900 / 10000"
## [1] "creating A, iter 6000 / 10000"
## [1] "creating A, iter 6100 / 10000"
## [1] "creating A, iter 6200 / 10000"
## [1] "creating A, iter 6300 / 10000"
## [1] "creating A, iter 6400 / 10000"
## [1] "creating A, iter 6500 / 10000"
## [1] "creating A, iter 6600 / 10000"
## [1] "creating A, iter 6700 / 10000"
## [1] "creating A, iter 6800 / 10000"
## [1] "creating A, iter 6900 / 10000"
## [1] "creating A, iter 7000 / 10000"
## [1] "creating A, iter 7100 / 10000"
## [1] "creating A, iter 7200 / 10000"
## [1] "creating A, iter 7300 / 10000"
## [1] "creating A, iter 7400 / 10000"
## [1] "creating A, iter 7500 / 10000"
## [1] "creating A, iter 7600 / 10000"
## [1] "creating A, iter 7700 / 10000"
## [1] "creating A, iter 7800 / 10000"
## [1] "creating A, iter 7900 / 10000"
## [1] "creating A, iter 8000 / 10000"
## [1] "creating A, iter 8100 / 10000"
## [1] "creating A, iter 8200 / 10000"
## [1] "creating A, iter 8300 / 10000"
## [1] "creating A, iter 8400 / 10000"
## [1] "creating A, iter 8500 / 10000"
## [1] "creating A, iter 8600 / 10000"
## [1] "creating A, iter 8700 / 10000"
## [1] "creating A, iter 8800 / 10000"
## [1] "creating A, iter 8900 / 10000"
## [1] "creating A, iter 9000 / 10000"
## [1] "creating A, iter 9100 / 10000"
## [1] "creating A, iter 9200 / 10000"
## [1] "creating A, iter 9300 / 10000"
## [1] "creating A, iter 9400 / 10000"
## [1] "creating A, iter 9500 / 10000"
## [1] "creating A, iter 9600 / 10000"
## [1] "creating A, iter 9700 / 10000"
## [1] "creating A, iter 9800 / 10000"
## [1] "creating A, iter 9900 / 10000"
## [1] "creating A, iter 10000 / 10000"
## [1] "finding duplicate rows, iter 100 / 10000"
## [1] "finding duplicate rows, iter 200 / 10000"
## [1] "finding duplicate rows, iter 300 / 10000"
## [1] "finding duplicate rows, iter 400 / 10000"
## [1] "finding duplicate rows, iter 500 / 10000"
## [1] "finding duplicate rows, iter 600 / 10000"
## [1] "finding duplicate rows, iter 700 / 10000"
## [1] "finding duplicate rows, iter 800 / 10000"
## [1] "finding duplicate rows, iter 900 / 10000"
## [1] "finding duplicate rows, iter 1000 / 10000"
## [1] "finding duplicate rows, iter 1100 / 10000"
## [1] "finding duplicate rows, iter 1200 / 10000"
## [1] "finding duplicate rows, iter 1300 / 10000"
## [1] "finding duplicate rows, iter 1400 / 10000"
## [1] "finding duplicate rows, iter 1500 / 10000"
## [1] "finding duplicate rows, iter 1600 / 10000"
## [1] "finding duplicate rows, iter 1700 / 10000"
## [1] "finding duplicate rows, iter 1800 / 10000"
## [1] "finding duplicate rows, iter 1900 / 10000"
## [1] "finding duplicate rows, iter 2000 / 10000"
## [1] "finding duplicate rows, iter 2100 / 10000"
## [1] "finding duplicate rows, iter 2200 / 10000"
## [1] "finding duplicate rows, iter 2300 / 10000"
## [1] "finding duplicate rows, iter 2400 / 10000"
## [1] "finding duplicate rows, iter 2500 / 10000"
## [1] "finding duplicate rows, iter 2600 / 10000"
## [1] "finding duplicate rows, iter 2700 / 10000"
## [1] "finding duplicate rows, iter 2800 / 10000"
## [1] "finding duplicate rows, iter 2900 / 10000"
## [1] "finding duplicate rows, iter 3000 / 10000"
## [1] "finding duplicate rows, iter 3100 / 10000"
## [1] "finding duplicate rows, iter 3200 / 10000"
## [1] "finding duplicate rows, iter 3300 / 10000"
## [1] "finding duplicate rows, iter 3400 / 10000"
## [1] "finding duplicate rows, iter 3500 / 10000"
## [1] "finding duplicate rows, iter 3600 / 10000"
## [1] "finding duplicate rows, iter 3700 / 10000"
## [1] "finding duplicate rows, iter 3800 / 10000"
## [1] "finding duplicate rows, iter 3900 / 10000"
## [1] "finding duplicate rows, iter 4000 / 10000"
## [1] "finding duplicate rows, iter 4100 / 10000"
## [1] "finding duplicate rows, iter 4200 / 10000"
## [1] "finding duplicate rows, iter 4300 / 10000"
## [1] "finding duplicate rows, iter 4400 / 10000"
## [1] "finding duplicate rows, iter 4500 / 10000"
## [1] "finding duplicate rows, iter 4600 / 10000"
## [1] "finding duplicate rows, iter 4700 / 10000"
## [1] "finding duplicate rows, iter 4800 / 10000"
## [1] "finding duplicate rows, iter 4900 / 10000"
## [1] "finding duplicate rows, iter 5000 / 10000"
## [1] "finding duplicate rows, iter 5100 / 10000"
## [1] "finding duplicate rows, iter 5200 / 10000"
## [1] "finding duplicate rows, iter 5300 / 10000"
## [1] "finding duplicate rows, iter 5400 / 10000"
## [1] "finding duplicate rows, iter 5500 / 10000"
## [1] "finding duplicate rows, iter 5600 / 10000"
## [1] "finding duplicate rows, iter 5700 / 10000"
## [1] "finding duplicate rows, iter 5800 / 10000"
## [1] "finding duplicate rows, iter 5900 / 10000"
## [1] "finding duplicate rows, iter 6000 / 10000"
## [1] "finding duplicate rows, iter 6100 / 10000"
## [1] "finding duplicate rows, iter 6200 / 10000"
## [1] "finding duplicate rows, iter 6300 / 10000"
## [1] "finding duplicate rows, iter 6400 / 10000"
## [1] "finding duplicate rows, iter 6500 / 10000"
## [1] "finding duplicate rows, iter 6600 / 10000"
## [1] "finding duplicate rows, iter 6700 / 10000"
## [1] "finding duplicate rows, iter 6800 / 10000"
## [1] "finding duplicate rows, iter 6900 / 10000"
## [1] "finding duplicate rows, iter 7000 / 10000"
## [1] "finding duplicate rows, iter 7100 / 10000"
## [1] "finding duplicate rows, iter 7200 / 10000"
## [1] "finding duplicate rows, iter 7300 / 10000"
## [1] "finding duplicate rows, iter 7400 / 10000"
## [1] "finding duplicate rows, iter 7500 / 10000"
## [1] "finding duplicate rows, iter 7600 / 10000"
## [1] "finding duplicate rows, iter 7700 / 10000"
## [1] "finding duplicate rows, iter 7800 / 10000"
## [1] "finding duplicate rows, iter 7900 / 10000"
## [1] "finding duplicate rows, iter 8000 / 10000"
## [1] "finding duplicate rows, iter 8100 / 10000"
## [1] "finding duplicate rows, iter 8200 / 10000"
## [1] "finding duplicate rows, iter 8300 / 10000"
## [1] "finding duplicate rows, iter 8400 / 10000"
## [1] "finding duplicate rows, iter 8500 / 10000"
## [1] "finding duplicate rows, iter 8600 / 10000"
## [1] "finding duplicate rows, iter 8700 / 10000"
## [1] "finding duplicate rows, iter 8800 / 10000"
## [1] "finding duplicate rows, iter 8900 / 10000"
## [1] "finding duplicate rows, iter 9000 / 10000"
## [1] "finding duplicate rows, iter 9100 / 10000"
## [1] "finding duplicate rows, iter 9200 / 10000"
## [1] "finding duplicate rows, iter 9300 / 10000"
## [1] "finding duplicate rows, iter 9400 / 10000"
## [1] "finding duplicate rows, iter 9500 / 10000"
## [1] "finding duplicate rows, iter 9600 / 10000"
## [1] "finding duplicate rows, iter 9700 / 10000"
## [1] "finding duplicate rows, iter 9800 / 10000"
## [1] "finding duplicate rows, iter 9900 / 10000"
## [1] "finding duplicate rows, iter 10000 / 10000"
## [1] 0.008
```
