rankhospital <- function(state, outcome, num = "best"){
    ## Function that ranks the hospitals in certain state and gives the 
    ## nth hospital in the ranking
    
    # Read outcome Data
    data = read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data[,11]<-as.numeric(data[,11])
    data[,17]<-as.numeric(data[,17])
    data[,23]<-as.numeric(data[,23])
    
    # Define mortality rates columns
    mRatesCols = list("heart attack"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                      "heart failure"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                      "pneumonia"="Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    mortalCol = mRatesCols[[outcome]]
    
    # Check that state and outcome are valid
    validStates = unique(data$State)
    validOutcomes = c("heart attack", "heart failure", "pneumonia")
    if (!(state %in% validStates)){
        stop("invalid state")
    }
    if (!(outcome %in% validOutcomes)){
        stop("invalid outcome")
    }
        
    #Select the data for the state and order it
    stateData = data[data$State==state, c("Hospital.Name",mortalCol)]

    
    stateData = stateData[!is.na(stateData[mortalCol]),]
    orderedData = stateData[order(stateData[,mortalCol],stateData$Hospital.Name),]
    
    # Test for num == "best" or "worst"
    if (num=="best"){
        return (head(orderedData,1)$Hospital.Name)
    }
    if (num == "worst"){
        return (tail(orderedData,1)$Hospital.Name)
    }
    # Return NA if num is larger than the Dataframe
    maxNum = length(stateData[,1])
    if (num>maxNum){
        return (NA)
    }
    
    # Return final value
    orderedData$Hospital.Name[num]
    
}
