complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    # Initialize the results Dataframe
    n = length(id)
    resDF = data.frame(id=numeric(n), nobs = numeric(n))
    # Loop through each file 
    for(cnt in 1:n){
        fileID = sprintf("%03d", id[cnt])
        fullpath = paste(directory,"/",fileID,".csv", sep="")
        filedata = read.csv(fullpath)
        nobs = sum(!is.na(filedata["sulfate"]) & !is.na(filedata["nitrate"]))
        resDF[["id"]][cnt] = id[cnt]
        resDF[["nobs"]][cnt] = nobs
    }
    
    resDF
}