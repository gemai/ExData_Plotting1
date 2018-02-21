## Read the file
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the two days we are interested in
consumption2days <- subset(consumption, consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007")

## Concatenate Date and Time variables in a new variable (dateandtime)
consumption2days$dateandtime <- strptime(paste(consumption2days$Date,consumption2days$Time),"%d/%m/%Y %H:%M:%S")

## Calculate the abbreviated day of the week of dateandtime in a new variable
consumption2days$dayoftheweek <- weekdays(as.Date(consumption2days$dateandtime), abbreviate = TRUE)

## Set up the margins and font size
par(mar = c(2,4,1,1), cex.axis = 0.75, cex.lab = 0.75)

## Create the plot
plot(consumption2days$dateandtime,                                      ## x value
     as.numeric(as.character(consumption2days$Sub_metering_1)),         ## y value     
     type = "l",                                                        ## plot type
     xlab = "",                                                         ## x-axis label     
     ylab = "Energy sub metering",                                      ## y-axis label   
     yaxp = c(0,30,3)                                                   ## y-axis ticks     
)

## Add Sub_metering_2
lines(consumption2days$dateandtime, as.numeric(as.character(consumption2days$Sub_metering_2)), type = "l", col = "orange")

## Add Sub_metering_3
lines(consumption2days$dateandtime, as.numeric(as.character(consumption2days$Sub_metering_3)), type = "l", col = "blue")

## Add legends top right corner
legend("topright",
       cex = 0.75,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "orange", "blue"),
       lty = 1)

## Save the plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)

## Close the PNG file
dev.off()

## Close the screen
dev.off(which = 2)