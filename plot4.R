## Read the file
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the two days we are interested in
consumption2days <- subset(consumption, consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007")

## Concatenate Date and Time variables in a new variable (dateandtime)
consumption2days$dateandtime <- strptime(paste(consumption2days$Date,consumption2days$Time),"%d/%m/%Y %H:%M:%S")

## Calculate the abbreviated day of the week of dateandtime in a new variable
consumption2days$dayoftheweek <- weekdays(as.Date(consumption2days$dateandtime), abbreviate = TRUE)

## Prepare the plotting area, margins and font size
par(mfrow = c(2,2), mar = c(4,4,0,1), cex.axis = 0.5, cex.lab = 0.5)

## Create the plots

with(consumption2days, {

        ## Plot 1 (top left)
        
        plot(consumption2days$dateandtime,                                      ## x value
             as.numeric(as.character(consumption2days$Global_active_power)),    ## y value
             type = "l",                                                        ## plot type
             xlab = "",                                                         ## x-axis label             
             ylab = "Global Active Power",                                      ## y-axis label 
             yaxp = c(0,6,3),                                                   ## y-axis ticks                          
             mgp = c(2,1,0)                                                     ## distance between axis and labels    
        )
        
        ## Plot 2 (top right)
        
        plot(consumption2days$dateandtime,                          ## x value
             as.numeric(as.character(consumption2days$Voltage)),    ## y value
             type = "l",                                            ## plot type
             xlab = "datetime",                                     ## x-axis label                  
             ylab = "Voltage",                                      ## y-axis label             
             yaxp = c(234,246,6),                                   ## y-axis ticks                          
             mgp = c(2,1,0)                                         ## distance between axis and labels
        )

        ## Plot 3 (bottom left)
        
        plot(consumption2days$dateandtime,                                 ## x value
             as.numeric(as.character(consumption2days$Sub_metering_1)),    ## y value
             type = "l",                                                   ## plot type
             xlab = "",                                                    ## x-axis label             
             ylab = "Energy sub metering",                                 ## y-axis label             
             yaxp = c(0,30,3),                                             ## y-axis ticks                          
             mgp = c(2,1,0)                                                ## distance between axis and labels             
        )
        
        ## Add Sub_metering_2
        lines(consumption2days$dateandtime, as.numeric(as.character(consumption2days$Sub_metering_2)), type = "l", col = "orange")
        
        ## Add Sub_metering_3
        lines(consumption2days$dateandtime, as.numeric(as.character(consumption2days$Sub_metering_3)), type = "l", col = "blue")
        
        ## Add legends top right corner
        
        legend("topright",
               inset = .02,
               cex = 0.5,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "orange", "blue"),
               lty = 1,
               box.lty = 0)

        ## Plot 4 (bottom right)
        
        plot(consumption2days$dateandtime,                                        ## x value
             as.numeric(as.character(consumption2days$Global_reactive_power)),    ## y value
             type = "l",                                                          ## plot type
             xlab = "datetime",                                                   ## x-axis label                  
             ylab = "Global_reactive_power",                                      ## y-axis label             
             yaxp = c(0.0,0.5,5),                                                 ## y-axis ticks                          
             mgp = c(2,1,0)                                                       ## distance between axis and labels             
        )
        
})

## Save the plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)

## Close the PNG file
dev.off()

## Close the screen
dev.off(which = 2)