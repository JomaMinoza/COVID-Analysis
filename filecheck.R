checkfolder <- function(foldername) {
    if(dir.exists(foldername) == FALSE) dir.create(foldername)
}
