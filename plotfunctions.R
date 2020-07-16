# File dependencies
# The following libraries must be installed first using install.packages()
require(dplyr)
require(reshape2)
require(ggplot2)
#################

# Source dependencies
source("filecontrol.R")

# Function list
ggplot_missmap <- function (df, title = "Missingness Map of DOH Data Drop", savefile = "") {
    
    message("Loading Missingmap (ggplot)")
    df.output <- df %>%
        is.na %>%
        melt %>%
        ggplot(data = .,
               aes(x = Var2,
                   y = Var1)) +
        geom_raster(aes(fill = value)) +
        scale_fill_grey(name = "Legend",
                        labels = c("Present","Missing")) +
        theme_minimal() + 
        theme(axis.text.x = element_text(angle = 90, hjust = 0.95, vjust = 0.3),
              plot.title = element_text(hjust = 0.5)) + 
        labs(x = "Variables in Dataset",
             y = "Row Number",
             title = title)
    
    if (savefile != "") {
        
        checkfolder("plots")
        ggsave(paste0("plots/", savefile))
    }
    
    return(df.output)
}

ggplot_histogram <- function (df, xaxis, title = "Histogram of COVID-19 Cases", Legend = NULL, pos = "identity", binnum = 30, xlabel = "", ylabel = "Number of Cases", savefile = "") {
    
    message("Loading Histogram")
    df.output <- df %>%
        ggplot(data = .,
               aes(x = xaxis, color = Legend, fill = Legend)) +
        geom_histogram(position = pos, bins = binnum) +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5)) +
        labs(x = xlabel,
             y = ylabel,
             title = title)
    
    if (savefile != "") {
        
        checkfolder("plots")
        ggsave(paste0("plots/", savefile))
    }
    
    return(df.output)
}

ggplot_tsa <- function (df, title = "Cumulative Plot of COVID-19 Cases", dates, csum, xlabel, ylabel, savefile = "") {
    
    message("Loading Time Series Analysis")
    df.output <- df %>%
        ggplot(data = .,
               aes(x = dates, color = "red", y = csum)) +
        geom_line(size = 1.5) +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5), legend.position = "none") +
        labs(x = xlabel,
             y = ylabel,
             title = title)
    
    if (savefile != "") {
        
        checkfolder("plots")
        ggsave(paste0("plots/", savefile))
    }
    
    return(df.output)
}

ggplot_log <- function (df, title = "Cumulative Plot of COVID-19 Cases (Logarithmic)", dates, csum, xlabel, ylabel, savefile = "") {
    
    message("Loading Time Series Analysis (Logarithmic)")
    df.output <- df %>%
        ggplot(data = .,
               aes(x = dates, color = "red", y = csum)) +
        geom_line(size = 1.5) +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5), legend.position = "none") +
        labs(x = xlabel,
             y = ylabel,
             title = title) +
        scale_y_log10()
    
    if (savefile != "") {
        
        checkfolder("plots")
        ggsave(paste0("plots/", savefile))
    }
    
    return(df.output)
}
