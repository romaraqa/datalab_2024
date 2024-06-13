library(babynames)
library(tidyverse)
library(dplyr)
library(ggplot2)

bb_names<- babynames


# 10) Create a histogram of the name Marie in 1982.
# 
ggplot(data = bb_names %>% filter(year > 1982) %>% filter(name == "Marie"), aes(x=year))+
         geom_histogram()
# 11) Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.

ggplot(data = bb_names %>% filter(name == "Joe"),
  aes(x = year, y = prop, col= sex)) +
  geom_line(alpha = .5) 
  
# 
# 12) Add new x and y axis labels, as well as a chart title.
# 
ggplot(data = bb_names %>% filter(name == "Joe"),
       aes(x = year, y = prop, col= sex)) +
  geom_line()+
  labs(title =  "Proportion of the name Joe",
        x ="year",
        y ="proportion")
# 13) Create a bar chart of all female names in 2002.
# 
females_2002 <- bb_names %>% 
  filter(year == 2002) %>% 
  filter(sex =="F")
 ggplot (data = females_2002, aes(x = name, y = prop, col = sex)) + 
  geom_col()

# 14) Make the bars transparent and filled with the color blue.
# 
 females_2002 <- bb_names %>% 
   filter(year == 2002) %>% 
   filter(sex =="F")
 ggplot (data = females_2002, aes(x = name, y = prop, col = sex)) + 
   geom_col(color = "blue")
# 15) Create a new data set called the_nineties that only contains years from the 1990s.
# 
 the_nineties <- bb_names %>% 
   filter(year >= 1990) %>% 
   filter(year <= 2000)
# 16) Save this dataset to your repository (use write.csv()).
# 
write.csv(the_nineties, "the_nineties.csv")
# 17) Add, commit, and push your files to GitHub.

female_1950 <- bb_names %>% 
  filter(year >1949) %>% 
  filter (year <1960) %>% 
  filter( sex == "F") %>% 
  arrange(desc(prop)) %>% 
  distinct(name) %>% 
  head(3)


ggplot(data = bb_names %>% filter(name == "Jesus"), aes(x = year, y = prop, color= sex))+
  geom_line()

  
 

