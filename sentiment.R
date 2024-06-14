library(tidyverse)
library(ggplot2)
library(dplyr)
library(gsheet)
library(tidytext)
library(wordcloud2)
library(sentimentr)
library(lubridate)

survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1W9eGIihIHppys3LZe5FNbUuaIi_tfdscIq521lidRBU/edit?usp=sharing')

survey<-survey %>% 
  mutate(date_time = mdy_hms(Timestamp))

ggplot(data = survey, aes(x = date_time))+
  geom_histogram()
         

sentiments <- get_sentiments('bing')

ncol(sentiments)
nrow(sentiments)


words <- survey %>%
  dplyr::select(first_name,
                feeling_num,
                feeling) %>%
  unnest_tokens(word, feeling)

word_freq <- words %>% group_by(word) %>% tally()

wordcloud2(word_freq)

sw <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/stopwords.csv')

not_sw_word<- word_freq %>% anti_join(sw, by="word")

top10 <- not_sw_word %>%
  arrange(desc(n)) %>% 
  head(10)

ggplot(data = top10, aes(x = word, y = n))+ 
  geom_col()

#word_sentiments<- word_freq %>% 
  right_join(sentiments, by = "word")

word_sentiments<- word_freq %>% 
  left_join(sentiments, by = "word")

word_sentiments %>% 
  group_by(sentiment) %>% 
  tally()


  
  