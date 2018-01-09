setwd("C:/Pluralsight")

#Load data from tab-delimited file

movies <- read.table(
  file = "Movies.txt",
  sep = "\t",
  header = TRUE,
  quote = "\"")

#Peak at data
head(movies)

#loot at colum names
names(movies)

# Look at colum 5
names(movies)[5]

# Rename varible
names(movies)[5] <- "Critic.Score"

names(movies)

# Problem #2: missing values
#Count missing values
sum(is.na(movies))


# Inspect rows with missing values
tail(movies)

#Exclude observation with missing values
movies <- na.omit(movies)

#Problem #2 solved
sum(is.na(movies))

#Problem #3 units in runtime colum
# peek at the movie runtime data
head(movies$Runtime)

#Note: this next line will throw an erroe
mean(movies$Runtime)

#Determine the data type
class(movies$Runtime)


#Cast from factor to character string
runtimes <- as.character(movies$Runtime)
head(runtimes)
class(runtimes)


#Elminate the unit of measure
runtimes <- sub("min","",runtimes)
head(runtimes)

#Cast the character string to integer
movies$Runtime <- as.integer(runtimes)
head(movies$Runtime)
class(movies$Runtime)



#Now we can perform mathmatical functions
mean(movies$Runtime)

#Problem 4: Box office uses three units of measure
head(movies$Box.Office)



#Create a function to convert box office revenue

convertBoxOffice <- function(boxOffice)
{
  stringBoxOffice <- as.character(boxOffice)
  
  replacedBoxOffice <- gsub("[$|k|M]", "", stringBoxOffice)
  
  numericBoxOffice <- as.numeric(replacedBoxOffice)
  
  if(grepl("M", boxOffice)){
    numericBoxOffice
  }
  else if(grepl("k", boxOffice)){
    numericBoxOffice * 0.001
    
  }
  else{
    numericBoxOffice * 0.000001
  }
  
}


#Convert Box Office to single unit of measure (millions)
movies$Box.Office <- sapply(movies$Box.Office, convertBoxOffice)


#problem 4 is solved
head(movies$Box.Office)
class(movies$Box.Office)
mean(movies$Box.Office)



#save data to a csv file
write.csv(movies,"Movies.csv")
