## created by Angel Ysla 20150105
## setwd("C:/Users/Angel/Desktop/Stuff/Learning/Coursera/4 Exploratory Data Analysis/Project 1")
# headers in data: Date Time Global_active_power Global_reactive_power Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3

plot4 <- function (){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings ="?")
  #data1<- strptime(data$Date, format='%d/%m/%Y %H:%M:%S')
  datasub<-subset(data, Date=="1/2/2007"| Date=="2/2/2007")
  #print (head(datasub))
  
  #graph4 multiple plots
  datasub$DateTime <- as.POSIXct(paste(datasub$Date, datasub$Time), format="%d/%m/%Y %H:%M:%S") 
  par(mfrow = c(2, 2), mar=c(4.5,3,0,0))
  with (datasub, {
    plot(datasub$DateTime, as.numeric(datasub$Global_active_power),type="l", ylab="Global Active Power", xlab= "")
    plot(datasub$DateTime, as.numeric(datasub$Voltage),type="l", ylab="Voltage", xlab= "datetime")
    plot(datasub$DateTime, as.numeric(datasub$Sub_metering_1),type="l",col="Black", ylab=" Energy sub metering", xlab="")
    points(datasub$DateTime, as.numeric(datasub$Sub_metering_2),type="l",col="Red")
    points(datasub$DateTime, as.numeric(datasub$Sub_metering_3),type="l",col="Blue")
    legend("topright", pch =1, col = c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(datasub$DateTime, as.numeric(datasub$Global_reactive_power),type="l", ylab="Global_reactive_power", xlab= "datetime")
  })
  dev.copy(png, file = "plot4.png",width = 480, height = 480)
  dev.off()
}