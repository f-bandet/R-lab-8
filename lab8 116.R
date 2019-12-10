# Name: Faye Bandet
# Date: 10/17/19
# ISTA 116 Section B || Section Leader : Jacob Heller
# Lab Assignment 8
# Collaborator(s): Nick Ackerman

download.file("http://www.openintro.org/stat/data/bdims.RData", destfile = "bdims.RData")
load("bdims.RData")

#1
fdims<-subset(bdims, sex==0)
hist(fdims$hgt, probability = TRUE)
# The histogram of probability density shows that female heights are normally distributed, because it is unimodal and fairly even.

#2
x<- seq(min(fdims$hgt), max(fdims$hgt), by = 0.1)
x
# First row is 147.2 147.3 147.4 147.5 147.6 147.7 147.8 147.9 148.0 148.1 148.2 148.3 148.4 148.5 148.6

#3
y <- dnorm(x, mean(x), sd(x))
y
# First row is 0.008709816 0.008855780 0.009003350 0.009152524 0.009303301 0.009455679 0.009609656

#4
lines(x, y, col = "limegreen")
# This line looks like a normal distribution line. The female heights do look like that.

#5
qqnorm(fdims$hgt)
qqline(fdims$hgt)
# If the data is normally distributed it would look like a nearly perfect increasing line. Female height data looks normally distributed.

#6
data <- rnorm(nrow(fdims), mean(fdims$hgt))
qqnorm(data)
qqline(data)
# The random data sample should be a fairly similar to the normal distribution because it is based from the actual data that is normally distributed, as seen with the qqnorm and the qqline. So, the data follows the normally distributed line.

#7
qqnormsim(data)
# We can use these plots to be confidant in the distribution of female heights because we see that all the plots follow the same qq line, with normal looking distribution. If the simulations had multiple plots that had more varience or looked different we would know that we should not be confidant that it has normal distribution.

#8
data2 <- rnorm(nrow(fdims), mean(fdims$wgt), sd(fdims$wgt))
data3 <- rnorm(nrow(fdims), mean(fdims$age), sd(fdims$age))
qqnorm(data2)
qqline(data2)
qqnorm(data3)
qqline(data3)
# Both randomly sampled weight and age follow the normal distribution line on the qq plot, but the distribution of age, especially around outliers, was a bit more off the line than weight which has stronger correlation. 

#9
pnorm(182, mean(fdims$hgt), sd(fdims$hgt), lower.tail = FALSE)
data[data >= 182]
# The data frame number closely matches the probability of 0.004434 because the estimate is a very small number, showing that it is unlikely. When calculating the proportion of women over 182 cm, I got numeric(0) which means there were no females in the random data set above 182 cm. It is close to the same as the prediction, which was less than half a percent likely to have a female over 182 cm. 

#10
value <- qnorm(.9, mean(fdims$hgt), sd(fdims$hgt), lower.tail = FALSE)
value
(100/length(fdims$hgt))*length(fdims$hgt[fdims$hgt <= value])
# The 90th percentile was 156.49, and 9.23% of the data was outside of the 90th percentile. It matched the percentile almost spot on. Since there is 10% of the data outside 90% around 9-10 is very close.
