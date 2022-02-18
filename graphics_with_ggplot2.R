# Graphics with ggplot2
# Load packages
library(tidyverse)
library(ggthemes)
# Load the msleep data set. 
suppressMessages(library(dplyr))
data(msleep)
head(msleep) # show first six rows
nrow(msleep) # there are 83 mammals in msleep dataframe
ncol(msleep) # there are 11 variables in msleep dataframe
names(msleep) # variable names 


