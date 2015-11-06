plot1 <- function(workdir) {
  
  setwd(workdir)
  
  # read in data  
  data <- read.table(paste0(getwd(),".//household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
  data <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  data$new_date <- paste(data$Date, data$Time)
  data$new_date <- strptime(data$new_date, "%d/%m/%Y %H:%M:%S")
#  data$new_date <- as.Date(data$new_date)

  # plot to png file
  png(file="plot1.png")
      hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
}