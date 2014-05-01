best <- function( state, outcome){
    
    # Read outcome Data
    data = read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data[,11]<-as.numeric(data[,11])
    data[,17]<-as.numeric(data[,17])
    data[,23]<-as.numeric(data[,23])

    mRatesCols = list("heart attack"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                      "heart failure"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                      "pneumonia"="Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    
    
    
    # Check that state and outcome are valid
    validStates = unique(data$State)
    validOutcomes = c("heart attack", "heart failure", "pneumonia")
    if (!(state %in% validStates)){
        stop("invalid state")
    }
    if (!(outcome %in% validOutcomes)){
        stop("invalid outcome")
    }
        
    # Return hospital name in that state with lowest
    # 30-day death rate
    
    # Define the correspondent mortality rate column
    mortalityCol = mRatesCols[[outcome]]
    stateData = data[data$State==state,]
    # Idx from mRates NOT FROM THE WHOLE DATAFRAME
    bestIdx = which.min(stateData[[mortalityCol]])
    best = stateData$Hospital.Name[bestIdx]
    return(best)

}