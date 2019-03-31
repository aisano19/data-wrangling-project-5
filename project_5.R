library(tidyverse)
setwd("/Users/aisano/Desktop/Springboard/3.1_DataWrangling")

# 0: Load the data in RStudio
df_titanic <- read.csv(file = "titanic_original.csv", stringsAsFactors = FALSE)

# Learn about the dataset
str(df_titanic)
summary(df_titanic)
head(df_titanic)


# 1: Port of embarkation
df_titanic$embarked[which(df_titanic$embarked == "")] <- "S"


# 2: Age
summary(df_titanic$age)
df_titanic$age[is.na(df_titanic$age)] <- mean(df_titanic$age, na.rm = TRUE)

# Other ways you could have populated the missing values in the age column. 
# Why would you pick any of those over the mean (or not)?
# Another possible option would be median. For this dataset, there isn't a big 
# difference between the two, it seems like. But if the dataset had outliers 
# that were extremely large or small, then median should've worked better than mean.


# 3: Lifeboat
summary(df_titanic$boat)
df_titanic$boat[df_titanic$boat == ""] <- "None"


# 4: Cabin
summary(df_titanic$cabin)
df_titanic$has_cabin_number <- ifelse(df_titanic$cabin != "", 1, 0)


# Save the dataframe as a .csv file
write.csv(df_titanic, "titanic_clean.csv")
