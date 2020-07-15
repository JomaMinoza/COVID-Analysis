require(dplyr)

#Used for number of cases by Sex
Dataframe %>% group_by(Sex) %>% summarise(n())

#Used for summarization of means
tapply(Dataframe$Age, Dataframe$Sex, summary)

#These lines are saved for plotting
print(ggplot_histogram(Dataframe, xaxis = Dataframe$Age, Legend = "", pos = "identity", xlabel = "Age", ylabel = "Number of Cases"))
print(ggplot_histogram(Dataframe, xaxis = Dataframe$Age, Legend = Dataframe$Sex, pos = "identity", xlabel = "Age", ylabel = "Number of Cases"))
print(ggplot_histogram(Dataframe, xaxis = Dataframe$Age, Legend = Dataframe$HealthStatus, pos = "identity", xlabel = "Age", ylabel = "Number of Cases"))

###################################

countdates <- Dataframe %>% count(Dataframe$DateRepConf)
names(countdates) <- c("Date", "Number of Cases")

#For Cumulative plot
print(ggplot_tsa(countdates, as.Date(countdates$Date), csum = cumsum(countdates$`Number of Cases`), "Dates", "Total # of Cases"))

#For Logarithmic plot
print(ggplot_log(countdates, as.Date(countdates$Date), csum = cumsum(countdates$`Number of Cases`), "Dates", "Total # of Cases"))
