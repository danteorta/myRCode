corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    # Initialize vectors
    corrs = numeric()
    
    # Get the relevant files
    source("complete.R")
    completed = complete(directory)
    toUse = completed[["id"]][completed["nobs"]>threshold]
    
    if(length(toUse)>0){
        for(filenum in toUse){
            # Read file
            file = sprintf("%03d", filenum)
            fullpath = paste(directory,"/",file,".csv", sep="")
            filedata = read.csv(fullpath)
            # Append the new data to the pollutant vectors
            index = !is.na(filedata["sulfate"]) & !is.na(filedata["nitrate"])
            sulfate = filedata["sulfate"][index]
            nitrate = filedata["nitrate"][index]
            # Return numeric vector of correlations
            corrs = c(corrs,cor(sulfate,nitrate))
        }
    }
    # Return empty vector if the threshold was not met
    else{corrs = numeric()}
    corrs
}