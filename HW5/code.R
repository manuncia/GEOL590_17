ggplot(test_data, aes(x=test_data$Levels, y=test_data$`Post-Photosynthesis`, color=test_data$Species)) + geom_point() +geom_smooth(method = lm, se = FALSE)
