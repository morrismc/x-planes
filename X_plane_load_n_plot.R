#################################### Set dir and load ####################################
# This script was written on November 2, 2018 by Matthew Morriss for 
# The purpose of downloading Xplane data from wikipedia and plotting.
setwd('/Users/matthew/Documents/GitHub/X-Planes')
rm(list = ls())
library(tidyverse)
library(ggplot2)
# library(xlsx)
library(ggalt)
library(scales)
library(gridExtra)
library(rvest)
library(plyr)
library(stringr)
library(textclean)
library(XML)
library(lubridate)
library(htmltab)
library(viridis)
library(htmltools)
library(webshot)
library(bsts)
library(extrafont)


#################################### load Data ####################################

#Download X1
X1 <-  htmltab('https://en.wikipedia.org/wiki/List_of_X-1_flights',3)

X1 <- X1[!(X1[,6] == "?"),]
X1$Date <- gsub(",",'',X1$Date)
X1$Date <- mdy(X1$Date)
X1$`Velocity-Mach-` <-  as.numeric(X1$`Velocity-Mach-`)

# Download X2
X2 <- htmltab('https://en.wikipedia.org/wiki/List_of_X-2_flights',2)
X2 <- X2[!(X2[,6] == "?"),]
X2$`Velocity-Mach-` <- gsub('\\+','',X2$`Velocity-Mach-`)
X2$`Velocity-Mach-` <-  as.numeric(X2$`Velocity-Mach-`)
X2$Date <- mdy(X2$Date)

#Download X15
X15 <- htmltab('https://en.wikipedia.org/wiki/List_of_X-15_flights',2)
X15$Date <- mdy(X15$Date)
X15$Mach <-  as.numeric(X15$Mach)
X15$`Altitude (m)` <- gsub(',','',X15$`Altitude (m)`)
X15$`Altitude (m)` <- as.numeric(X15$`Altitude (m)`)


#################################### Plot speed v year####################################
p <-  ggplot(X1, aes(x = X1$Date, y = X1$`Velocity-Mach-`                    ))+
  geom_point(aes(color = 'X1'))+
  geom_point(data = X15, aes(x = X15$Date, y = X15$Mach,
                             color = 'X15'))+
  geom_point(data = X2, aes(x = X2$Date, y = X2$`Velocity-Mach-`,
                            color = 'X2'))+
  
  theme_classic()+
  scale_y_continuous(name = 'Mach',
                     limits = c(0,7),
                     breaks = pretty(X15$Mach, n = 10))+
  labs(x = 'Date (yr)',
       color = 'Aircraft')+
  theme(text = element_text(size = 16, family = 'Times'))
  

p   
#################################### Plot year v X-15 ####################################

s <- ggplot(X15, aes(x = X15$Date, y = X15$`Altitude (m)`,
                     color = X15$Mach))+
  
  geom_point(size = 2)+
    
    theme_classic()+
    scale_y_continuous(name ='Altitude (m)',
                            breaks = pretty(X15$`Altitude (m)`, n = 10))+
    labs(x = 'Date (yr)', color = 'Mach')+
  theme(text = element_text(size = 16, family = 'Times')) +
  # scale_color_brewer(palette = 'Set1')
  # scale_fill_brewer(palette = "Set1")
  # scale_color_manual( values=c("red","green","blue"))
  scale_colour_gradient2()

s
#################################### X-15 mach v altitude####################################

m <- ggplot(X15, aes(x = X15$Mach, y = X15$`Altitude (m)`))+
  
  geom_point()+
  theme_classic()+
  theme(text = element_text(size = 16, family = 'Times')) +
  labs(x = 'Mach #',y = 'Altitude (m)',
       title = 'X-15 test')

m
  
