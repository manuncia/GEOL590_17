
# This is a R-script using the diamonds dataset from ggplot package.
# Out of the dataset, a subset of 1410 was created using set.seed function.

str(diamonds)
nrow(diamonds) # there are 53940 rows
set.seed(1410)

# A dataframe was created for the subset data.

dsmall <- diamonds[sample(nrow(diamonds), 100), ]
str(dsmall)

# A plot (e.g. scatterplot) y vs x, colored by z values and faceted by cut 

ggplot(dsmall, aes(x=x, y=y, color=z)) + geom_point() + facet_wrap(~ dsmall$cut)
Task_4_1 <- ggplot(dsmall, aes(x=x, y=y, color=z)) + geom_point() + facet_wrap(~ dsmall$cut)
print(Task_4_1)

# A plot (e.g.scatterplot) of price vs carat, colored by cut, Using the smoothed -"lm" method, 
# standard error bars will not be shown.

ggplot(dsmall, aes(x=carat,y=price,color=cut)) + geom_point() + geom_smooth(method = "lm", se = FALSE)
Task_4_2 <- ggplot(dsmall, aes(x=carat,y=price,color=cut)) + geom_point() + geom_smooth(method = "lm", se = FALSE)
print(Task_4_2)

# A plot (e.g. densityplot) of density vs carat, faceted by clarity. 

ggplot(dsmall, aes(x=carat, colour=clarity)) + geom_density() + facet_wrap(~ dsmall$clarity)
Task_4_3 <- ggplot(dsmall, aes(x=carat, colour=clarity)) + geom_density() + facet_wrap(~ dsmall$clarity)
print(Task_4_3)

# A plot (e.g. boxplot) of price as a function of cut 

ggplot(dsmall, aes(factor(cut), price)) + geom_boxplot(color)
Task_4_4 <- ggplot(dsmall, aes(factor(cut), price)) + geom_boxplot()
print(Task_4_4)

# A plot (e.g.scatterplot) of y versus x where points are assigned a red color,  smoothing lines in
# blue and the line dashed with fat dashes (linetype=2). 

ggplot(dsmall, mapping = aes(x=x, y=y)) + geom_line(aes(colour=x, group=x)) + geom_point(aes(colour=x), size=3, colour= "red") + geom_smooth(colour = "blue", linetype= 2) + xlab("x, in mm") +ylab("y, in mm") 
Task_4_5 <- ggplot(dsmall, mapping = aes(x=x, y=y)) + geom_line(aes(colour=x, group=x)) + geom_point(aes(colour=x), size=3, colour= "red") + geom_smooth(colour = "blue", linetype= 2) + xlab("x, in mm") +ylab("y, in mm") 
print(Task_4_5)

# This is the ugly plot using a dataset (test_data) on photosynthesis of trees after exposure to ammonia gas. 

str(test_data)
uglyplot1 <- ggplot(test_data, aes(x=Levels, y=test_data$`Post-Photosynthesis`, color=test_data$'Species')) + geom_violin(fill="light green") + facet_wrap(~ test_data$Species) + ylab("Post-Photosynthesis") + theme_grey() 
ggplot(test_data, aes(x=Levels, y=test_data$`Post-Photosynthesis`, color=test_data$'Species')) + geom_area() + facet_wrap(~ test_data$Species)
ggsave("uglyplot1.png", width = 8, height = 5)