plot2 <- function(workdir) {
  
  setwd(workdir)
  
  # read in data  
  data <- read.table(paste0(getwd(),".//household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
  data <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  data$new_date <- paste(data$Date, data$Time)
  data$new_date <- strptime(data$new_date, "%d/%m/%Y %H:%M:%S")
#  data$new_date <- as.Date(data$new_date)

  #Plot to png file
  png(file="plot2.png")
      plot(data$new_date, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  dev.off()

}