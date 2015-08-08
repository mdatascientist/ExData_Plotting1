plot2 <- function(){
  
  # install.packages("sqldf")
  library(sqldf)
  
  file <- "./Data/household_power_consumption.txt"
  data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")
  
  # Convert the Date and Time variables 
  # to Date/Time classes in R using the strptime() and as.Date() functions.
  dt <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  # Plot2 - Global Active Power
  # Frequency by Global Active Power (kilowatts) / Day
  png('plot2.png',width=480,height=480)
  gap <- as.numeric(data$Global_active_power)
  plot(dt,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  #Finished plotting - cleanup
  dev.off()
  
}