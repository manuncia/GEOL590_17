a <- 1
b <- 2
c <- a + b
set.seed(0)
d <- rnorm(20)
e <- rnorm(20)
f <- d + e
f1 <- factor("a"", b, c)
levels(f1)<-rev(levels(f1))
f2 <- rev(factor(letters))
f3 <- factor(letters, levels=rev(letters))]
l <- (1:5)
attr (l, "units") <- "m"
length(mtcars)
nrow(mtcars)
ncol(mtcars)
mtcars1 <- subset(mtcars, wt < 3 | wt > 4)
mtcars2 <- mtcars[,c ("mpg", "wt")]
read.csv("C://Users//marifeanunciado//Desktop//R//HW//2016_10_11_plate_reader.csv", skip = 33)
read.csv("C://Users//marifeanunciado//Desktop//R//2016_10_11_plate_reader.csv", skip = 33)
str("2016_10_11_plate_reader.csv")
mtcars[mtcars$cyl]
mtcars["cyl"]
str(mtcars)
median(mtcars1$mpg)
mtcars[mtcars$cyl == 4, ]
mtcars [-1:-4, ]
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6 ]
mtcars [mtcars$cyl <= 5, ]
mtcars[which(mtcars$mpg == median.default(mtcars$mpg)),]
mtcars[which(mtcars$mpg == median(mtcars$mpg)), ]
data.frame()
attributes(mtcars)
dim(mtcars)
mtcars [ mtcars$mpg == median(mtcars$mpg), ]
mtcars which
rownames(mtcars$)[c(1...31)]