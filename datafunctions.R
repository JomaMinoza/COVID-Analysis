message("Running \"datafunctions.R\"")

# Source dependencies
source("filecontrol.R")

# Function list
DataExtract <- function (code, filename = "", overwrite = FALSE, na.assign = FALSE) {
    
    checkfolder("files")
    if (filename == "") stop("argument \"filename\" missing. Please enter a filename.")
    
    urllink <<- paste0("https://drive.google.com/uc?export=download&id=", code)
    
    if (file.exists(paste0("files/", filename)) == FALSE | overwrite == TRUE) {
        download.file(urllink, destfile = paste0("files/", filename), quiet = FALSE)
        DownloadDate <<- Sys.time()
    }
    else {
        ctemp <- file.info(paste0("files/", filename))
        DownloadDate <<- ctemp$ctime
    }
    
    df <- read.csv(paste0("files/",filename), header = TRUE)
  # df$Sex <- factor(df$Sex , levels=levels(df$Sex)[order(levels(df$Sex), decreasing = TRUE)]) # Rearrange level order; optional
    
    if (na.assign == TRUE) df <- replace(df, df == "", NA)
    
    message(paste("Download Date:", DownloadDate))
    message("File extracted successfully.")
    
    return(df)
}

DataSampling <- function (df, percent = 0.7, seednum = NA) {
    
    if (percent <= 0 | percent >= 1) stop("Enter \"percent\" with a value between 0 to 1")
  
    if (is.numeric(seednum) == TRUE) set.seed(seednum)
    else {
        seednum <- runif(1)
        set.seed(seednum)
    }
    SeedNumber <<- seednum
    
    samplesize <- ceiling(nrow(df) * percent)
    samplenums <- sample(nrow(df), size = samplesize)
    
    TrainData <- df[samplenums,]
    message("Train Data has been stored to the list name \"TrainData\"")
    TestData <- df[-samplenums,]
    message("Test Data has been stored to the list name \"TestData\"")
    
    outputlist <- list(TrainData, TestData)
    names(outputlist) <- c("TrainData","TestData")
    
    message("Data successfully sampled")
    
    return(outputlist)
}
