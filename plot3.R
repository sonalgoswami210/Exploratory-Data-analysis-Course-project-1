## read the given data
## subset the given dates
## convert the Date and Time variables to Date/Time classes 

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
+                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
> data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
> data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
> datetime <- paste(as.Date(data1$Date), data1$Time)

> head(datetime)
[1] "2007-02-01 00:00:00" "2007-02-01 00:01:00"
[3] "2007-02-01 00:02:00" "2007-02-01 00:03:00"
[5] "2007-02-01 00:04:00" "2007-02-01 00:05:00"
> data1$Datetime <- as.POSIXct(datetime)

## create a png file
> png("plot3.png", width = 480, height = 480)

## plot the graph
> with(data1, {
+     plot(Sub_metering_1~Datetime, type="l",
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~Datetime,col='Red')
+     lines(Sub_metering_3~Datetime,col='Blue')
+ })

## add the legend
> legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
+        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
> dev.off()
null device 
          1 
