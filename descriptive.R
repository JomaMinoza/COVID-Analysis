# Source dependencies
source("plotfunctions.R")

# This script is an example on how to produce descriptive results of the data.
# The following variables passed to the functions were created using "script.R".
# You can use these codes as a guide to change the variable to produce different results.

# Used for printing out Missingness Map of the data
print(ggplot_missmap(Dataframe))

# Outputs the number of cases by Sex and Health Status in the console
print(Dataframe %>% group_by(Sex) %>% summarise(n()))
print(Dataframe %>% group_by(HealthStatus) %>% summarise(n()))

# Outputs summarization of means
print(tapply(Dataframe$Age, Dataframe$Sex, summary))

# These lines outputs histograms that are saved for plotting
print(ggplot_histogram(Dataframe,
                xaxis = Dataframe$Age,
                title = "Histogram of COVID-19 Cases",
                pos = "identity",
                xlabel = "Age",
                ylabel = "Number of Cases"))

print(ggplot_histogram(Dataframe,
                xaxis = Dataframe$Age,
                title = "Histogram of COVID-19 Cases by Sex",
                Legend = Dataframe$Sex,
                pos = "stack",
                xlabel = "Age",
                ylabel = "Number of Cases"))

print(ggplot_histogram(Dataframe,
                xaxis = Dataframe$Age,
                Legend = Dataframe$HealthStatus,
                pos = "stack",
                xlabel = "Age",
                ylabel = "Number of Cases"))

# These two lines were used to create a cumulative column for line plotting (see below)
Casecount <- Dataframe %>% count(Dataframe$DateRepConf)
names(Casecount) <- c("Date", "Number.of.Cases")

# Outputs the cumulative plot of COVID-19 Cases
print(ggplot_tsa(Casecount,
           dates = as.Date(Casecount$Date),
           csum = cumsum(Casecount$Number.of.Cases),
           xlabel = "Dates",
           ylabel = "Total # of Cases"))

# Outputs the cumulative plot of COVID-19 Cases in logarithmic scale
print(ggplot_log(Casecount,
           dates = as.Date(Casecount$Date),
           csum = cumsum(Casecount$Number.of.Cases),
           xlabel = "Dates",
           ylabel = "Total # of Cases"))
