## created by Angel Ysla 20150105
## setwd("C:/Users/Angel/Desktop/Stuff/Learning/Coursera/4 Exploratory Data Analysis/Project 1")
# headers in data: Date Time Global_active_power Global_reactive_power Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3

plot2 <- function (){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings ="?")
  #data1<- strptime(data$Date, format='%d/%m/%Y %H:%M:%S')
  datasub<-subset(data, Date=="1/2/2007"| Date=="2/2/2007")
  #print (head(datasub))
  
  #plot2
  datasub$DateTime <- as.POSIXct(paste(datasub$Date, datasub$Time), format="%d/%m/%Y %H:%M:%S") 
  plot(datasub$DateTime, as.numeric(datasub$Global_active_power),type="l", ylab="Global Active Power (killowatts)", xlab= "")
  dev.copy(png, file = "plot2.png")
  dev.off()
}