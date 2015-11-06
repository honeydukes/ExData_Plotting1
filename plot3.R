plot3 <- function(workdir) {
  
  setwd(workdir)
  
  # read in data  
  data <- read.table(paste0(getwd(),".//household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
  data <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  data$new_date <- paste(data$Date, data$Time)
  data$new_date <- strptime(data$new_date, "%d/%m/%Y %H:%M:%S")
#  data$new_date <- as.Date(data$new_date)

  # plot to png file
  png(file="plot3.png")  

      plot(data$new_date, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
      lines(data$new_date, data$Sub_metering_2, type = "l", col = "red")
      lines(data$new_date, data$Sub_metering_3, type = "l", col = "blue")
      legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()

}