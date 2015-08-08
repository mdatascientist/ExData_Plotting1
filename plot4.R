plot4 <- function(){
  
  # install.packages("sqldf")
  library(sqldf)
  
  file <- "./Data/household_power_consumption.txt"
  data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")
  
  # Convert the Date and Time variables 
  # to Date/Time classes in R using the strptime() and as.Date() functions.
  dt <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
  data$Time <- strptime(data$Time,format = "%H%M")
  
  # Put multiple plots on the same graphics pages
  png('plot4.png',width=480,height=480)
  par(mfrow = c(2, 2)) 
  
  ### PLOT 4a ###
  # Frequency by Global Active Power (kilowatts) / Day
  gap <- as.numeric(data$Global_active_power)
  plot(dt,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  ### PLOT 4b ###
  # Voltage / Datetime
  volt <- as.numeric(data$Voltage)
  plot(dt,volt,type="l",xlab="datetime",ylab="Voltage")
  
  
  ### PLOT 4c ###
  sm1 <- as.numeric(data$Sub_metering_1)
  sm2 <- as.numeric(data$Sub_metering_2)
  sm3 <- as.numeric(data$Sub_metering_3)
  
  plot(dt,sm1,type="l",xlab="",ylab="Energy sub metering")
  lines(dt,sm2,col="red")
  lines(dt,sm3,col="blue")
  
  #Add the Legend
  legend("topright"
         ,c("sub_metering_1","sub_metering_2","sub_metering_3")
         ,col=c("black", "red", "blue") #The color of points or lines appearing in the legend
         ,lty=1,lwd=2 #Line types and widths
         ,cex = 0.70 #Change Legend Size
  )
  
  ### PLOT 4d ###
  # Global Reactive Power / Datetime
  grp <- as.numeric(data$Global_reactive_power)
  plot(dt,grp,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  #Finished plotting - cleanup
  dev.off()

}