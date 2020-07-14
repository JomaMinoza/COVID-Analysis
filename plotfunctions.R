# The following libraries must be installed first using install.packages()
require(dplyr)
require(reshape2)
require(ggplot2)
require(Amelia)
#################

amelia_missmap <- function (df) {
    
    message("Loading Missingmap (Amelia)")
    missmap(df, legend = TRUE, col = c("red","white"),
            main = "Missingness Map of DOH Data Drop",
            margins = c(7,3))
}

ggplot_missmap <- function (df) {
    
    message("Loading Missingmap (ggplot)")
    df %>% 
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
             title = "Missingness Map of DOH Data Drop")
}
