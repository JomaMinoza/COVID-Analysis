require(dplyr)

sorted.data <- DataFilter(Dataframe, status = TRUE, columns = c("Age","Sex","HealthStatus"))
cleaned.data <- sorted.data[!is.na(sorted.data$Age) | !is.na(sorted.data$Sex),]

#Used for number of cases by Sex
cleaned.data %>% group_by(Sex) %>% summarise(n())

#Used for summarization of means
tapply(cleaned.data$Age, cleaned.data$Sex, summary)

#These lines are saved for plotting
write.csv(cleaned.data, file = "files/COVID-19 Short Details.csv")
print(ggplot_histogram(cleaned.data, xaxis = cleaned.data$Age, Legend = cleaned.data$Sex, xlabel = "Age", ylabel = "Number of Cases"))
print(ggplot_histogram(cleaned.data, xaxis = cleaned.data$Age, Legend = cleaned.data$HealthStatus, xlabel = "Age", ylabel = "Number of Cases"))

###################################

