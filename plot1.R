plot1 <- function(){
  
  # install.packages("sqldf")
  library(sqldf)
  
  file <- "./Data/household_power_consumption.txt"
  data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

  # Convert the Date and Time variables 
  # to Date/Time classes in R using the strptime() and as.Date() functions.
  data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
  data$Time <- strptime(data$Time,format = "%H%M")
  
  # Plot1 - Global Active Power
  # Frequency by Global Active Power (kilowatts)
  png('plot1.png',width=480,height=480)
  gap <- as.numeric(data$Global_active_power)
  hist(gap, main="Global Active Power"
          ,xlab = "Global Active Power (kilowatts)"
          ,ylab = "Frequency"
          ,col = "red") 
  
  #Finished plotting - cleanup
  dev.off()
  
}