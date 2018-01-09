setwd("c:/Pluralsight")

# Load csv data
movies <- read.csv(
  file = "Movies.csv",
  quote = "\""
)

genres <- read.csv(
  file = "Genres.csv",
  quote = "\""
)


#peek at data
head(movies)


head(genres)


#Univariate statistics for qualitative variable
table(movies$Rating)


table(genres$Genre)


# mean
mean(movies$Runtime)

median(movies$Runtime)


# Determine the max Runtime as well as the location(i.e index)
which.max(table(movies$Runtime))


# Analyze the spread of a quantitative variable

min(movies$Runtime)


max(movies$Runtime)

range(movies$Runtime)

diff(range(movies$Runtime))

quantile(movies$Runtime)

quantile(movies$Runtime,0.25)

quantile(movies$Runtime,0.90)


# 75% - 25% (113-93 =20)
IQR(movies$Runtime)

var(movies$Runtime)


sd(movies$Runtime)

#Analyze the shape of a quantititive variable
install.packages("moments")

library(moments)

skewness(movies$Runtime)

kurtosis(movies$Runtime)


plot(density(movies$Runtime))


#summarize a quatitative variable
summary(movies$Runtime)


#Bivariate statistics for two qualitative variables
table(genres$Genre, genres$Rating)


#Bivariate statistics for two quantitative variables

# Covarience
cov(movies$Critic.Score, movies$Box.Office)

cov(movies$Runtime, movies$Box.Office)


#correlation coefficients

cor(movies$Critic.Score, movies$Box.Office)

cor(movies$Runtime, movies$Box.Office)


# Bivariate statistics for both a qualitative and quantitative variable
tapply(movies$Box.Office, movies$Rating, mean)

tapply(genres$Box.Office, genres$Genre, mean)

# Summarize entire table
summary(movies)
