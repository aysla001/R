## created by Angel Ysla 20150105
## setwd("C:/Users/Angel/Desktop/Stuff/Learning/Coursera/4 Exploratory Data Analysis/Project 1")
# headers in data: Date Time Global_active_power Global_reactive_power Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3

plot1 <- function (){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings ="?")
  #data1<- strptime(data$Date, format='%d/%m/%Y %H:%M:%S')
  datasub<-subset(data, Date=="1/2/2007"| Date=="2/2/2007")
  #print (head(datasub))
  
  #graph 1 histrogram. needs to have updated labels to make the x scale kilowatts
  #dev.copy(png, file = "plot1.png")
  hist(as.numeric(datasub$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  #png(filename = "plot1.png")
  dev.copy(png, file = "plot1.png")
  dev.off()

}