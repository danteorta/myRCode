directory = "C:/Users/Dante/Documents/Data Science Specialization/R Programming/Programming Assignments/1/rprog_data_specdata/specdata/"

pollutantmean <- function (directory, pollutant, id = 1:332){
    # Initialize empty vector for all the pollutant data
    pollutantData = numeric()
    # Loop through each file
    for(filenum in id){
        file = sprintf("%03d", filenum)
        fullpath = paste(directory,file,".csv", sep="")
        filedata = read.csv(fullpath)
        dataMonit = filedata[pollutant][!is.na(filedata[pollutant])]
        pollutantData = c(pollutantData, dataMonit)
    }
    # Calculate the mean of all the data
    mean(pollutantData)
}