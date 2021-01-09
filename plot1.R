# Importing libraries
library(dplyr)
library(data.table)

# Reading the .txt file
df <- fread("household_power_consumption.txt", sep = ";", 
            na.strings = c("?"),
            colClasses = c(rep("character",2),rep("numeric",7)))



# Getting the subset of dates from 2007-02-01 to 2007-02-02.
sub.df <- df %>%
    filter(Date %in% c("1/2/2007","2/2/2007")) %>%
    mutate(DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), .after = Time)
   

# Open the file
png("plot1.png", width=480, height=480) 

# Histogram of Global Active Power
with(sub.df, hist(Global_active_power, col = "red", 
                  xlab = "Global Active Power (kilowatts)",
                  main = "Global Active Power"))


# Close the file
dev.off()
    