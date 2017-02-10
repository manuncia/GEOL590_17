a <- 1
str(a)
b <- 2
c <- a+b
str(c)
#data structure of a, b and c are numerical values
set.seed(0) # set.seed ensures random result will be the same for everyone
d <- rnorm(20)
e <- rnorm(20)
str(d)
f <- d + e
str(f)
L <- (1:5)
attr (L, "units") <- "meters"
str(L) # L is transformed from an integer form to an atomic object
f1 <- factor(letters)
str(f1)
levels(f1) <- rev(levels(f1))
str(levels(f1))
str(f1) #f1 structure shows a factor with 26 levels that starts with a... 
#with code rev, turns it into a character "chr" or strings that starts with z
f2 <- rev(factor(letters))
str(f2)
f3 <- factor(letters, levels = rev(letters)) #Unlike f1, f2 and f3 options
#change the order of the objects in the vector or levels of letters
dim(f1)
dim(levels(f1))
dim(f2)
dim(f3)
as.matrix(f1) # organize the object into a matrix
f1output <-c (f1)
data.frame(0,0) # yes, a dataframe can have 0 rows and 0 columns
read.csv("C://Users//marifeanunciado//Downloads//2016_10_11_plate_reader.csv", skip = 33 )
plates <- "C://Users//marifeanunciado//Downloads//2016_10_11_plate_reader.csv" #argument skip deletes
#the first 33 lines that isnt necessary for the study
read.csv("C://Users//marifeanunciado//Downloads//2016_10_11_plate_reader.csv", skip = 33 )
read.csv("C://Users//marifeanunciado//Downloads//2016_10_11_plate_reader.csv") # after tidyverse has
#been installed, it eliminated the r-squared column
nrow(mtcars) #number of rows
length(mtcars) #number of columns as R reads from left to right
col(mtcars) #number of columns
cylinder <- mtcars$cyl
cylinder [mtcars$mpg]
mtcars [(mtcars$wt<3 | mtcars$wt>4), ]
mtcars [ , c(1,6)]
mtcars[which(mtcars$mpg == median.default(mtcars$mpg)),]
mtcars[mtcars$cyl == 4, ] # cars with 4 cylinders only
mtcars [-1:-4, ] # delete the first 4 cars in the rows
mtcars [mtcars$cyl <=5, ]
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ]
