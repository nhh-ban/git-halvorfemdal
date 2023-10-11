library(tidyverse)
library(stringr)

#Read the lines of the .txt file
raw_file <- readLines(con = "suites_dw_Table1.txt")

#Identify which line that starts with "--", which is the seperator
line_number <- which(substr(raw_file, start = 1, stop = 2) == "--")

#Store variable descriptions in separate .txt file
cat(raw_file[1:(line_number-2)],sep = "\n",file = "variable_descriptions.txt")


#MY ALTERNATIVE WAY -----

#Remove the -------+----- seperator
cleaned_file <- raw_file[-line_number]

#Create data table using cleaned file without seperator, which makes the 
#headers automatically, not necesssary to store them first.

data <- cleaned_file[(line_number-1):length(cleaned_file)] %>% 
  str_replace_all("\\|", ",") %>%  # Replace | with ,
  str_replace_all(" ", "") %>% #Remove empty spaces
  paste(collapse = "\n") %>%  # Collapse to make it a single string
  read_csv() # Read it as csv data


#Following galaxy_skeleton 2 ----

#Store variable names.  NOT NECESARRY
variable_names <- 
  str_split(string = raw_file[line_number-1], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

comma_separated_values <- 
  raw_file[(line_number+1):length(raw_file)] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values) 

cat(comma_separated_values_with_names, sep = "\n", file = "new_dataframe.csv")
galaxies <- read_csv("new_dataframe.csv")
