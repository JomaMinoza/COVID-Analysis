# This is a sample simulation on how the data was collected and analyzed
# Make sure to set your working directory where the other R files are located before running the script

# Used to make a fresh R interface
if (!is.null(dev.list())) dev.off()
cat("\014")
rm(list=ls())

# Source dependencies
source("datafunctions.R")

# Retrieve Data from link
Dataframe <- DataExtract(filename = "COVID-Data.csv", na.assign = TRUE)

# Data Sampling guide
Splittest <- DataSampling(Dataframe, seednum = 78)

# Outputs the descriptive statistics on COVID-19 Cases
source("descriptive.R")
