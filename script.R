# This is a sample simulation on how the data was collected and analyzed
# Make sure to set your working directory where the other R files are located before running the script

rm(list=ls())
source("~/R/COVID-Analysis/datafunctions.R")
source("~/R/COVID-Analysis/plotfunctions.R")

Dataframe <- DataExtract(filename = "COVID-Data.csv", na.assign = TRUE)
DataSampling(Dataframe, seednum = 25)

print(ggplot_missmap(Dataframe))
