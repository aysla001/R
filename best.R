## created by Angel Ysla 201406
## coursera programming assignment 3 part 1 best function
## don't forget to source after changing source ("best.R")
## setwd("C:/Users/Angel/Desktop/Stuff/Learning/Coursera/R Programming/Week 4")
## Function parameters state and outcome reason (ex: heart attack, heart failure, pneuonia)
##	will return the best hospital in the state
## Key R functionality used: sorting order, if/else, as.numeric
## Logic: set stop variable to true (meaning stop) at begining and only allow for valid states in order by section 

best <- function(state, OutcomeReason){
	stop <- "TRUE"

	## read in data
	outcome <- read.csv ("outcome-of-care-measures.csv", colClasses = "character")
	##head(outcome)
	##outcome[,7]<-as.charachter(outcome[,11])
	##options(warn=-1)
	outcome[,11]<- as.numeric(outcome[,11])
	options(warn=-1)
	outcome[,17]<-as.numeric(outcome[,17])
	options(warn=-1)
	outcome[,23]<-as.numeric(outcome[,23])
	options(warn=-1)
	##check state names

	vec<-names(table(outcome$State))
	if (is.na(match(state,vec)) ) { stop("invalid state") }
	##check outcome reasons
	if (OutcomeReason == "heart attack"){
		stop<-"FALSE"
	}
	if (OutcomeReason == "heart failure"){
		stop<-"FALSE"
	} 
	if (OutcomeReason == "pneumonia") {
		stop<-"FALSE"
	}

	if (stop=="TRUE"){
		print("Error in Outcome Reason specified")
	}
	## return hospital name in that state with lowest 30-day death
	if (stop == "FALSE") {
		if (OutcomeReason=="heart failure") 
		{sort <- outcome[order(outcome[,7],outcome[,17],outcome[,2],na.last=NA) , ] 
		print(sort[match(state,sort$State),2])} 
		else if (OutcomeReason=="heart attack") 
		{sort <- outcome[order(outcome[,7],outcome[,11],outcome[,2],na.last=NA) , ] 
		print(sort[match(state,sort$State),2])} 
		else if (OutcomeReason=="pneumonia") 
		{sort <- outcome[order(outcome[,7],outcome[,23],outcome[,2],na.last=NA) , ] 
		print(sort[match(state,sort$State),2])}
	}
}

