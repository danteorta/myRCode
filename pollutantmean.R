
pollutantmean <- function (directory, pollutant, id = 1:332){
    # Initialize empty vector for all the pollutant data
    pollutantData = numeric()
    # Loop through each file
    for(filenum in id){
        # Add leading zeroes
        file = sprintf("%03d", filenum)
        fullpath = paste(directory,"/",file,".csv", sep="")
        filedata = read.csv(fullpath)
        # Drop NAs and append the data to a vector
        dataMonit = filedata[pollutant][!is.na(filedata[pollutant])]
        pollutantData = c(pollutantData, dataMonit)
    }
    # Calculate the mean of all the data
    mean(pollutantData)
}