a <- 1
b <- 2
c <- a + b
set.seed(0)
d <- rnorm(20)
e <- rnorm(20)
f <- d + e
f1 <- factor(letters)
levels(f1)<-rev(levels(f1))
f2 <- rev(factor(letters))
f3 <- factor(letters, levels=rev(letters))
length(mtcars)
nrow(mtcars)
ncol(mtcars)
mtcars1 <- subset(mtcars, wt < 3 | wt > 4)
mtcars2 <- mtcars[,c ("mpg", "wt")]
read.csv("C://Users//marifeanunciado//Desktop//R//2016_10_11_plate_reader.csv", skip = 33)


