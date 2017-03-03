# install stringr, dplyr, tidyverse, nycflights, babynames, ggplot2, reshape, tibble, tidyr

#This is task 7.1

#displays the nyc flights with an outlier of windspeed greater than 500
nycflights13::weather %>% ggplot(aes(x=origin, y=wind_speed, color="red")) + geom_point()

#filters the outlier
flights_filter2 <- nycflights13::weather %>% 
  filter(wind_speed < 250) %>% group_by(origin) %>% arrange(desc, (wind_speed))

flights_filter3 <- nycflights13::weather %>% 
  filter(wind_speed < 250) %>% group_by(wind_speed)

flights_filter3 <- nycflights13::weather %>% 
  filter(wind_speed < 250) %>% group_by(wind_speed) %>% arrange(desc(wind_speed))

#calculates the median for each direction at each airport
flights_filter3 %>% group_by(origin,wind_dir,wind_speed) %>%
      summarise(med_WS = median(wind_speed, na.rm=TRUE)) %>%
      mutate(med_WS) %>%
      select(origin,wind_dir,med_WS)

#single table for summary of median at each direction for each airport
summary_median_WS <- flights_filter3 %>% group_by(origin,wind_dir,wind_speed) %>%
  summarise(med_WS = median(wind_speed, na.rm=TRUE)) %>%
  mutate(med_WS) %>%
  select(origin,wind_dir,med_WS)

# EWR table and plot

EWR_median_final <- summary_median_WS %>% 
  filter(origin == "EWR") %>% arrange(desc(wind_dir))

EWR_median_final %>% ggplot(aes(x=wind_dir,fill = med_WS)) + 
  geom_bar(width = 8, colour = "blue") + coord_polar(theta = "x") + 
  labs(title = "Median Wind Speed over Direction in EWR")

# JFK table and plot

JFK_median_final <- summary_median_WS %>% 
  filter(origin == "JFK") %>% arrange(desc(wind_dir))

JFK_median_final %>% ggplot(aes(x=wind_dir,fill = med_WS)) + 
  geom_bar(width = 8, colour = "red") + coord_polar(theta = "x") + 
  labs(title = "Median Wind Speed over Direction in JFK")

# LGA table and plot

LGA_median_final <- summary_median_WS %>% 
  filter(origin == "LGA") %>% arrange(desc(wind_dir))

LGA_median_final %>% ggplot(aes(x=wind_dir,fill = med_WS)) + 
  geom_bar(width = 8, colour = "purple") + coord_polar(theta = "x") + 
  labs(title = "Median Wind Speed over Direction in LGA")

# The following are plots for Task 7.1
#a
summary_median_WS %>% ggplot(aes(x=wind_dir, y=med_WS, color=origin)) + 
  geom_boxplot() + facet_grid(~ origin) +
  labs(x= "Wind direction", y= "Wind speed, median") + theme_classic() +
  ggsave("summary_median_WS.png", width = 5, height = 5)
#b
summary_median_WS %>% ggplot(aes(x=med_WS, y=wind_dir, color=origin)) + 
  geom_boxplot() + facet_grid(~ origin) +
  labs(x= "Wind speed, median", y= "Wind direction") + theme_classic() +
  ggsave("summary_median_WS_2.png", width = 5, height = 5)

# The following windrose are trials:
# windrose plot A
flights_filter2 %>% ggplot(aes(x=wind_speed, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "x") + scale_fill_brewer(palette = "accent")
flights_filter2 %>% ggplot(aes(x=wind_speed, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "x")
# windrose plot B
flights_filter2 %>% ggplot(aes(x=wind_speed, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "y") 
flights_filter2 %>% ggplot(aes(x=wind_speed, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "y") + scale_fill_brewer(palette = "accent")
#windrose plot C
flights_filter2 %>% ggplot(aes(x=wind_dir, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "x")
flights_filter2 %>% ggplot(aes(x=wind_dir, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "x") + scale_fill_brewer(palette = "accent")
#windrose plot D
flights_filter2 %>% ggplot(aes(x=wind_dir, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "y")
flights_filter2 %>% ggplot(aes(x=wind_dir, fill = origin)) + 
  geom_bar(width=1) + coord_polar(theta = "y") + scale_fill_brewer(palette = "accent")

# The following step by step extraction of rows specified:
# JFK, filter other origins, highest median is 14.96 at 290 wind direction
JFK <- flights_filter2 %>%
  filter(!grepl("EWR|LGA", origin)) 
JFK_median <- JFK %>% group_by(wind_dir) %>% 
  summarise(median= median(wind_speed, na.rm=TRUE)) 
JFK_median %>%  arrange(desc(median))

JFK_median %>% ggplot(aes(x=median, fill = wind_dir)) + 
  geom_bar(width = 1) + scale_fill_manual(coord_polar('x')) 
JFK_median %>% ggplot(aes(x=median, fill = wind_dir))
+ coord_polar() + labs(title = "JFK Wind Direction")

#makes JFK plot
JFK_median %>% 
  ggplot(aes(median, wind_dir)) +
  geom_point(aes(colour=median))+ 
  scale_colour_gradient(low = "light blue", high = "dark blue") +
  labs(x= "Wind Speed, median", y= "Wind Direction", title = "Wind Speed by Direction")

# EWR, filter other origins, highest median is 12.66 at 290 wind direction
EWR <- flights_filter2 %>%
  filter(!grepl("JFK|LGA", origin)) 
EWR_median <- EWR %>% group_by(wind_dir) %>% 
  summarise(median= median(wind_speed, na.rm=TRUE)) 
EWR_median %>%  arrange(desc(median))

#makes EWR plot
EWR_median %>% 
  ggplot(aes(median, wind_dir)) +
  geom_point(aes(colour=median))
+ 
  scale_colour_gradient(low = "light green", high = "dark green") +
  labs(x= "Wind Speed, median", y= "Wind Direction", title = "Wind Speed by Direction") 
  + theme_dark()

# LGA, filter other origins, highest median is 13.81 at 270 wind direction
LGA <- flights_filter2 %>%
  filter(!grepl("EWR|JFK", origin)) 
LGA_median <- LGA %>% group_by(wind_dir) %>% 
  summarise(median= median(wind_speed, na.rm=TRUE)) 
LGA_median %>%  arrange(desc(median))

#makes LGA plot
LGA_median %>% 
  ggplot(aes(median, wind_dir)) +
  geom_point(aes(colour=median))+ 
  scale_colour_gradient(low = "grey", high = "purple") +
  labs(x= "Wind Speed, median", y= "Wind Direction", title = "Wind Speed by Direction") 
  + theme_dark()

# This is task 7.2

# joins everything that matches carrier
combined_flightsairlines <- 
  full_join(nycflights13::flights, nycflights13::airlines, by = "carrier") 
# only takes flights originating fro JFK
JFK_flightairlines <- combined_flightsairlines %>% filter(!grepl("EWR|LGA", origin)) 
# takes the median of each flight
JFK_median <- JFK_flightairlines %>% group_by(name) %>% 
  summarise(median= median(distance, na.rm=TRUE)) %>% arrange(desc(median)) 
# only 2 columns with carrier name and median distance in descending order
#plot for task 7.2
JFK_median %>% ggplot(aes(x=median, y = name)) + 
  geom_col(width = 2, colour = "yellow") + theme_dark() 
  + ggsave("JFK_median.png", width=5, height=5)


#This is task 7.3
# takes only flights in EWR
EWR_flightairlines <- combined_flightsairlines %>% filter(!grepl("JFK|LGA", origin)) 
# takes month and airlines as the major row
EWR_wide1 <- cast(EWR_flightairlines, month~name, value = "flight")
EWR_wide2 <- cast(EWR_flightairlines, name~month,value = "flight")
is.data.frame(EWR_wide2)
write.csv(EWR_wide1, "EWR_WideData_1.csv")
write.csv(EWR_wide2, "EWR_WideData_2.csv")

# trials on spread
EWR_wide3 <- EWR_flightairlines %>% select(month, name, distance) 
spread(EWR_flightairlines, "month", "name", "distance")
EWR_wide4 <- spread(EWR_flightairlines, "month", "name", "distance")
EWR_wide2 %>% ggplot(aes(x=month, fill=flight)) + 
  geom_bar()

# this is Task 7.4

babynames_2014 <- babynames %>% 
  filter(year > 2013) %>%
  arrange(desc(prop)) 
#male: Noah,Liam,Mason,Jacob,William,Ethan,Michael,Alexander,James,Daniel
#female: Emma,Olivia,Sophia,Isabella,Ava,Mia,Emily,Abigail,Madison,Charlotte

pop2014_names <- babynames %>%
  filter(name == "Noah" | 
           name == "Liam" | 
           name == "Mason" | 
           name =="Jacob"| 
           name =="William" | 
           name =="Ethan" | 
           name =="Michael" | 
           name == "Alexander" | 
           name =="James" | 
           name == "Daniel" | 
           name =="Emma" | 
           name =="Olivia" | 
           name == "Sophia" | 
           name =="Isabella" | 
           name =="Ava" | 
           name =="Mia" | name =="Emily" | 
           name =="Abigail" | 
           name =="Madison" | 
           name =="Charlotte")
pop2014_names %>%
  ggplot(aes(year,prop, color=name)) +
  geom_point(size=1) + xlab("Year") + ylab("Proportion")
ggsave ("pop2014_names.png", width = 10, height = 5)

#only includes 2014 most popular names
# male
pop2014_names_Male <- babynames %>%
  filter(name == "Noah" | 
           name == "Liam" | 
           name == "Mason" | 
           name =="Jacob"| 
           name =="William" | 
           name =="Ethan" | 
           name =="Michael" | 
           name == "Alexander" | 
           name =="James" | 
           name == "Daniel") 
           
pop2014_names_Male %>%
ggplot(aes(year,prop, color=name)) +
geom_point(size=1) + xlab("Year") + ylab("Proportion")
ggsave ("pop2014_names_Male.png", width = 10, height = 5)

# female
pop2014_names_female <- babynames %>%
  filter( name =="Emma" | 
           name =="Olivia" | 
           name == "Sophia" | 
           name =="Isabella" | 
           name =="Ava" | 
           name =="Mia" | name =="Emily" | 
           name =="Abigail" | 
           name =="Madison" | 
           name =="Charlotte")

pop2014_names_female %>%
  ggplot(aes(year,prop, color=name)) +
  geom_point(size=1) + xlab("Year") + ylab("Proportion")
ggsave ("pop2014_names_female.png", width = 10, height = 5)

#plots frequency of most popular 2014 names since 1880

#1896
baby_1896 <- babynames %>% 
  filter(year == 1896) %>%
  arrange(desc(prop))      # 1896 year only

female_1896 <- baby_1896 %>% 
  filter(!grepl("M", sex)) %>% arrange(desc(prop))   ## female only

female_1896_pop <- female_1896 %>%
  filter(name == "Martha" | name == "Esther" | name == "Frances" | name =="Edith") 
                  #only includes 26th to 29th names
#1942
baby_1942 <- babynames %>% 
  filter(year == 1942) %>%
  arrange(desc(prop))      # 1942 year only

female_1942 <- baby_1942 %>% 
  filter(!grepl("M", sex)) %>% arrange(desc(prop))   ## female only

female_1942_pop <- female_1942 %>%
  filter(name == "Marilyn" | name == "Diane" | name == "Martha" | name =="Frances") 
#only includes 26th to 29th names

#2014
baby_2014 <- babynames %>% 
  filter(year == 2014) %>%
  arrange(desc(prop))      # 2014 year only

female_2014 <- baby_2014 %>% 
  filter(!grepl("M", sex)) %>% arrange(desc(prop))   ## female only

female_2014_pop <- female_2014 %>%
  filter(name == "Brooklyn" | name == "Lily" | name == "Hannah" | name =="Layla") 
       #only includes 26th to 29th names
# 4 popular female names for 3 years (1896, 1942, 2014)
common_names <- bind_rows(list(female_1896_pop, female_1942_pop, female_2014_pop)) 
common_names2 <- bind_cols(list(female_1896_pop, female_1942_pop, female_2014_pop))
write.csv(common_names, "Common Girl Names_26th_29th.csv")

# Using nasaweather datasets on storms
# 1. calculate the average disturbance for each year
# 2. plot the disturbance from year 1996 to 2000
# 2. look at the weather disturbance that occurred in 1995
# 3. determine the months with weather disturbances

weather_2 <- nasaweather::storms %>% group_by(name, year, type) %>% 
  summarise(Disturbance =max(seasday, na.rm=TRUE)) %>%
  mutate(Disturbance) %>% select(name, year, type, Disturbance)

weather_2 %>% ggplot(aes(x=year, y=Disturbance, color=type)) + 
  geom_point(position = "jitter") + facet_grid(~ type)  + 
  xlab("Year") + ylab("Weather Disturbance, mean") + theme_dark()
ggsave("weather1.png", width = 10, height = 5)

weather_2 %>% ggplot(aes(x= year, y=Disturbance, color=type)) + 
  geom_jitter(stat="identity")  + 
  xlab("Year") + ylab("Weather Disturbance, mean") + theme_classic()
ggsave("weather2.png", width = 8, height = 5)

Weather_1995 <- weather_2 %>% filter(year == 1995) %>% group_by(type)

# displays the weather disturbance for 1995 and max disturbance
Weather_1995 %>% ggplot(aes(x=name, y=Disturbance, color=type)) + 
  geom_point(size=2) + xlab("Name") + ylab("Weather Disturbance, mean") + theme_grey()
ggsave("weather3.png", width = 12, height = 5)

# displays weather disturbance each month
weather_3 <- nasaweather::storms %>% group_by(month, year, type) %>% 
  summarise(Disturbance =max(seasday, na.rm=TRUE)) %>%
  mutate(Disturbance) %>% select(month, year, type, Disturbance)

Weather_1995_month <- weather_3 %>% filter(year == 1995) %>% group_by(type)

Weather_1995_month %>% ggplot(aes(x=month, y=Disturbance, color=type)) + 
  geom_point() + facet_grid(~ type)  + 
  xlab("Month in a Year") 
+ ylab("Weather Disturbance, mean") + theme_dark()
ggsave("weather4.png", width = 10, height = 5)

Weather_1995_month %>% ggplot(aes(x=month, y=Disturbance, color=type)) + 
  geom_point() + facet_grid(~ month)  + 
  xlab("Month in a Year") 
+ ylab("Weather Disturbance, mean") + theme_dark()
ggsave("weather5.png", width = 10, height = 3)

