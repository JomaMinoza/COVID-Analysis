# Source dependencies
source("filecontrol.R")

# Function list
DataExtract <- function (filename = "", na.assign = FALSE) {
    
    checkfolder("files")
    if (filename == "") stop("argument \"filename\" missing. Please enter a filename.")
    
    if (file.exists(paste0("files/", filename)) == FALSE) {
        urllink <<- "https://drive.google.com/uc?export=download&id=1mPqxNLaMwDE9lQVNNByiu433BqCqRVWm"
        download.file(urllink, destfile = paste0("files/", filename), quiet = FALSE)
        DownloadDate <<- Sys.time()
    }
    else {
        ctemp <- file.info(paste0("files/", filename))
        DownloadDate <<- ctemp$ctime
    }
    
    df <- read.csv(paste0("files/",filename), header = TRUE)
    df$Sex = factor(df$Sex, levels = c("MALE","FEMALE"))
    
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
    
    TrainData <- df[samplenums,]
    TestData <- df[-samplenums,]
    
    outputlist <- list(TrainData, TestData)
    names(outputlist) <- c("TrainData","TestData")
    
    message("Train Data has been stored to the variable TrainData")
    message("Test Data has been stored to the variable TestData")
    message("Data successfully sampled.")
    
    return(outputlist)
}

DataFilter <- function (df, status = TRUE, columns) {
    
    if (status == TRUE) {
        df <- subset(df, HealthStatus == c(
                   "ASYMPTOMATIC",
                   "CRITICAL",
                   "DIED",
                   "MILD",
                   "RECOVERED",
                   "SEVERE"))
        
        message("The data filtered the dataset by existing Health Status")
    }
    
    df <- subset(df, select=columns)
    
    message("Data filtering completed")
    
    return(df)
}
