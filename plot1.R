## Read the file
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the two days we are interested in
consumption2days <- subset(consumption, consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007")

## Set up the margins and font size
par(mar = c(4,4,1,1), cex.axis = 0.75, cex.lab = 0.75)

## Histogram
hist(as.numeric(as.character(consumption2days$Global_active_power)),  ## x value
     main = "Global Active Power",                                    ## plot title
     xlab = "Global Active Power (kilowatts)",                        ## x-axis label
     xaxp = c(0,6,3),                                                 ## x-axis ticks 
     yaxp = c(0,1200,6),                                              ## y-axis ticks
     col = c("orange")                                                ## bars colours
)

## Save the plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## Close the PNG file
dev.off()

## Close the screen
dev.off(which = 2)