# This is the ugly plot using a dataset (test_data) on photosynthesis of trees after exposure to ammonia gas. 

str(test_data)
uglyplot1 <- ggplot(test_data, aes(x=Levels, y=test_data$`Post-Photosynthesis`, color=test_data$'Species')) + geom_violin(fill="light green") + facet_wrap(~ test_data$Species) + ylab("Post-Photosynthesis") + theme_grey() 
ggplot(test_data, aes(x=Levels, y=test_data$`Post-Photosynthesis`, color=test_data$'Species')) + geom_area() + facet_wrap(~ test_data$Species)
ggsave("uglyplot1.png", width = 8, height = 5)