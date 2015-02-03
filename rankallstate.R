rankallstate<- function(OutComeReason, rank){
	outcome<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	length_outcome <- length(outcome)
	counter_st <-1
	for(i in length_outcome){
		if (counter == 1){
		
		} else {
		results <- rbind (results, data.frame(id = i, nobs = outcome))
		}
	}

}