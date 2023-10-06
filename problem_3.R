library(tidyverse)
library(ggplot2)

galaxies <- read_csv("new_dataframe.csv")


#Create a histogram with the a_26 variable

ggplot(galaxies, aes(x=a_26)) +
  geom_histogram(binwidth=1, fill="blue", color="black", alpha=0.7) +
  labs(
       x="Linear diameter of the galaxy in kpc",
       y="Frequency") +
  theme_minimal()

#The plot shows us that the distribution of the linear diameter of the galaxies
#has a long tail to the right. (Right-skewed distribution)
#This means that the tail of the distribution extends towards more positive or 
#larger values

#A possible explanation to this is that the smaller galaxies can be harder to 
#spot, especially if they are far away, and therefore are missing in the dataset



