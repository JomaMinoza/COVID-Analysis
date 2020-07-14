DataExtract <- function (filename = "COVID-Data.csv", na.assign = FALSE) {
    
    if (file.exists(filename) == FALSE) {
        urllink <<- "https://drive.google.com/uc?export=download&id=1mPqxNLaMwDE9lQVNNByiu433BqCqRVWm"
        download.file(urllink, destfile = filename, quiet = FALSE)
        DownloadDate <<- Sys.time()
    }
    else {
        ctemp <- file.info(filename)
        DownloadDate <<- ctemp$ctime
    }
    
    df <- read.csv(filename, header = TRUE)
    
    if (na.assign == TRUE) df <- replace(df, df == "", NA)
    
    message(paste("Download Date:", DownloadDate))
    message("File extracted successfully.")
    
    return(df)
}

DataSampling <- function (df, percent = 0.7, seednum = NA) {
    
    if (is.numeric(seednum) == TRUE) set.seed(seednum)
    else {
        seednum <- runif(1)
        set.seed(seednum)
    }
    SeedNumber <<- seednum
    
    samplesize <- ceiling(nrow(df) * percent)
    samplenums <- sample(nrow(df), size = samplesize)
    
    TrainData <<- df[samplenums,]
    TestData <<- df[-samplenums,]
    
    message("Train Data has been stored to the variable \"TrainData\"")
    message("Test Data has been stored to the variable \"TestData\"")
    message("Data successfully sampled.")
}
