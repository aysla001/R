## created by Angel Ysla 201406
## coursera programming assignment 3 part 2 rank hospital
## don't forget to source after changing source ("rankhospital.R")
## setwd("C:/Users/Angel/Desktop/Stuff/Learning/Coursera/R Programming/Week 4")
## Function parameters state (2 chars), outcome, and ranking of a hospital in that state for that outcome (num)
##	Function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital.
## Key R functionality used: 
## Logic: set stop variable to true (meaning stop) at begining and only allow for valid states in order by section. 
##		1 read outcome-of-care-measures.csv into outcome variable
##		2 turn columns 11, 17, and 23 as numeric. ignore warnings 
##		3 create a vector 
##		4 if outcome reason matches heart attack, heart failure, pneumonia, else error out
##		5 based on outcome reason sort certain column 11 (heart attack), 17 (heart failure), 23 (pneumonia)
##		6 what to do with best/worst

rankall <- function(OutcomeReason, rank){
	stop <- "TRUE"

	## read in data
	#outcome <- read.csv ("outcome-of-care-measures.csv", colClasses = "character")
	outcome<- read.csv("outcome-of-care-measures.csv")
	##head(outcome)
	##outcome[,7]<-as.charachter(outcome[,11])
	##options(warn=-1)
	#KNOWN ISSUE DOES NOT INPUT NOT APPLICABLE VALUES CORRECTLY. ALLOWS VALUES IN COLUMN 11 WHERE VALUE IS NOT APPLICABLE IMPORT?
	outcome[,11]<- as.numeric(outcome[,11])
	options(warn=-1)
	outcome[,17]<-as.numeric(outcome[,17])
	options(warn=-1)
	outcome[,23]<-as.numeric(outcome[,23])
	options(warn=-1)
	##check state names

	vec<-names(table(outcome$State))
	if (is.na(match(state,vec)) ) { stop("invalid state") }
	if (is.na(match(OutcomeReason,c("heart attack", "heart failure", "pneumonia")))) {stop ("invalid outcome")}
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
	if (OutcomeReason == "heart attak"){
		stop("Error in outcome reason specified")
	} 
	if (stop=="TRUE"){
		stop("Error in Outcome Reason specified")
	}

	## return hospital name in that state with lowest 30-day death
	if (stop == "FALSE") {
		if (OutcomeReason=="heart failure"){
			data.new <- outcome[order(outcome$State, outcome[,17], outcome$Hospital.Name,na.last=NA),] 
			z <- which(data.new$State %in% state) #tell me which hospitals are for each state
			start <- z[1] #tell me where the first hospital is, which should also be the best one 
			total <- length(z) #tell me how many hospitals there are for that state
			if (rank == "best") {rank <- 1} #what to do with best
				else if (rank == "worst") {rank <- as.numeric(total)} #what to do with worst
				location <- start + rank - 1 #this should be the location of the num'th ranked hospital in the state in the dataset
				print (as.charcter(data.new$Hospital.Name[location]))} # as.character turns results into a CHARACTER VECTOR
		else if (OutcomeReason=="heart attack"){
			data.new <- outcome[order(outcome$State, outcome[,11], outcome$Hospital.Name,na.last=NA),] 
			z <- which(data.new$State %in% state) #tell me which hospitals are for each state
			start <- z[1] #tell me where the first hospital is, which should also be the best one 
			total <- length(z) #tell me how many hospitals there are for that state
			if (rank == "best") {rank <- 1} #what to do with best
				else if (rank == "worst") {rank <- as.numeric(total)} #what to do with worst
				location <- start + rank - 1 #this should be the location of the num'th ranked hospital in the state in the dataset
				print (as.character(data.new$Hospital.Name[location]))} # as.character turns results into a CHARACTER VECTOR
		else if (OutcomeReason=="pneumonia") {
			data.new <- outcome[order(outcome$State, outcome[,23], outcome$Hospital.Name,na.last=NA),] 
			z <- which(data.new$State %in% state) #tell me which hospitals are for each state
			start <- z[1] #tell me where the first hospital is, which should also be the best one 
			total <- length(z) #tell me how many hospitals there are for that state
			if (rank == "best") {rank <- 1} #what to do with best
			else if (rank == "worst") {rank <- as.numeric(total)} #what to do with worst
				location <- start + rank - 1 #this should be the location of the num'th ranked hospital in the state in the dataset
				print (as.character(data.new$Hospital.Name[location]))} # as.character turns results into a CHARACTER VECTOR
	}
}
