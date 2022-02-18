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

# Find out if total sleep time has a relationship with mammal body weight. 
ggplot(data = msleep, mapping = aes(x = bodywt, y = sleep_total)) +
  geom_point()+
  labs(x ="Body Weight", y = "Total Amount of Sleep")

# 1) log(x)
ggplot(data = msleep, mapping = aes(x = bodywt, y = sleep_total)) +
  geom_point() + scale_x_log10()+
  labs(x ="Body Weight", y = "Total Amount of Sleep")

# 2) log(y)
ggplot(data = msleep, mapping = aes(x = bodywt, y = sleep_total)) +
  geom_point() + scale_y_log10()+
  labs(x ="Body Weight", y = "Total Amount of Sleep")

# 3) log(x) and log(y)
ggplot(data = msleep, mapping = aes(x = bodywt, y = sleep_total)) +
  geom_point() + scale_x_log10() + scale_y_log10()+
  labs(x ="Body Weight", y = "Total Amount of Sleep")

# Color code the plot in part 4 by the diet of the animals (vore)
# 1) Axis labels nice
# 2) Change the theme to black and white
# 3) Add a meaningful title to the plot.
ggplot(data = msleep) +
  geom_point(mapping = aes(x = bodywt, y = sleep_total, color = vore))+
  theme_bw()+
  scale_x_log10() + scale_y_log10() +
  ggtitle("'Body weight' vs 'Total amount of sleep'")+
  labs(x ="Body Weight", y = "Total Amount of Sleep")
# Add an OLS line (without standard errors) for each vore category.
ggplot(data = msleep, mapping = aes(x = bodywt, y = sleep_total, color = vore)) +
  geom_point()+
  geom_smooth(se = FALSE, method = lm)+
  scale_x_log10() + scale_y_log10() +
  theme_bw()+
  ggtitle("'Body weight' vs 'Total amount of sleep'")+
  labs(x ="Body Weight", y = "Total Amount of Sleep")
# Copy the plot from 6 and add the overall (across all vore types) OLS line (without standard errors) to the above plot.
# Make sure this new line is black, dashed, and has width of 0.5.
ggplot(data = msleep, mapping = aes(x = bodywt, y = sleep_total, color = vore)) +
  geom_point()+
  geom_smooth(se = FALSE, method = lm, linetype = "dashed",color = "black", lwd = .5)+
  scale_x_log10() + scale_y_log10() +
  theme_bw()+
  ggtitle("'Body weight' vs 'Total amount of sleep'")+
  labs(x ="Body Weight", y = "Total Amount of Sleep")

### Copy the plot from 7 and change the title of the legend to “Diet”.

ggplot(data = msleep, mapping = aes(x = bodywt, y = sleep_total, color = vore)) +
  geom_point()+
  geom_smooth(se = FALSE, method = lm, linetype = "dashed", color = "black", lwd = .5)+
  theme_bw()+
  scale_x_log10() + scale_y_log10() +
  ggtitle("'Body weight' vs 'Total amount of sleep'")+ 
  scale_color_discrete(name = "Diet")+
  labs(x ="Body Weight", y = "Total Amount of Sleep")

