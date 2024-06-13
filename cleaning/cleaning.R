library(dplyr)
library(readr)
library(tidyverse)



messy_dives <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives-messy.csv')

head(messy_dives)

names(messy_dives) <- c( 

  'species' , #ID 
  'behavior', #bhvr
  'prey.volume',#prevolume
  'prey.depth',#predepth
  'dive.time', #dive_time
  'surface.time',#surfacetime
  'blow.interval',#
  'blow.number',
  'year',
  'month',
  'day',
  'sit'
)
  
messy_dives<- messy_dives %>% 
  mutate(year = ifelse(nchar(year)== 2, paste0 ("20",year),year)) %>% 
  mutate(day = ifelse(nchar(day)== 1, paste0("0", day), day)) %>% 
  mutate(month = ifelse(nchar(month)==1, paste0("0", month),month)) %>% 
  mutate(sit = substr(sit, 10,12))

#creating the ID 
messy_dives <- messy_dives %>% 
  arrange(year,month,day) %>% 
  mutate(id = paste0(year,month,day,sit)) %>% 
  select(-sit,-month,-year,-day)


#drop NA 
messy_dives <- messy_dives %>% 
  drop_na()


#Changing output in species
messy_dives<- messy_dives %>% 
  filter(species %in% c( 'FW','HW','FinW', 'Hw'))

  
  

  
