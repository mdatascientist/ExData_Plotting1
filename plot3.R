plot3 <- function(){
  
  
  # install.packages("sqldf")
  library(sqldf)
  
  file <- "./Data/household_power_consumption.txt"
  data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")
  
  # Convert the Date and Time variables 
  # to Date/Time classes in R using the strptime() and as.Date() functions.
  dt <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  # Plot3 - Energy sub metering
  # 
  sm1 <- as.numeric(data$Sub_metering_1)
  sm2 <- as.numeric(data$Sub_metering_2)
  sm3 <- as.numeric(data$Sub_metering_3)
  
  png('plot3.png',width=480,height=480)
  plot(dt,sm1,type="l",xlab="",ylab="Energy sub metering")
  lines(dt,sm2,col="red")
  lines(dt,sm3,col="blue")
  
  #Add the Legend
  legend("topright"
          ,c("sub_metering_1","sub_metering_2","sub_metering_3")
          ,col=c("black", "red", "blue") # the color of points or lines appearing in the legend
          ,lty=1,lwd=2 #  line types and widths
        )
  
  #Finished plotting - cleanup
  dev.off()
  
}