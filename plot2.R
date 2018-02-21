## Read the file
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the two days we are interested in
consumption2days <- subset(consumption, consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007")

## Concatenate Date and Time variables in a new variable (dateandtime)
consumption2days$dateandtime <- strptime(paste(consumption2days$Date,consumption2days$Time),"%d/%m/%Y %H:%M:%S")

## Calculate the abbreviated day of the week of dateandtime in a new variable
consumption2days$dayoftheweek <- weekdays(as.Date(consumption2days$dateandtime), abbreviate = TRUE)

## Set up the margins
par(mar = c(2,4,1,1))

## Create the plot
plot(consumption2days$dateandtime,                                      ## x value
     as.numeric(as.character(consumption2days$Global_active_power)),    ## y value     
     type = "l",                                                        ## plot type
     xlab = "",                                                         ## x-axis label
     ylab = "Global Active Power (kilowatts)"                           ## y-axis label  
     )

## Save the plot to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)

## Close the PNG file
dev.off()

## Close the screen
dev.off(which = 2)