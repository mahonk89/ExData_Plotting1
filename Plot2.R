# The first section is collecting and formatting data to create the data frame
# The second section is code for creating the plot
# Section 2
getwd()
initialdir<-getwd() # WD differs from Dir where data is
datadir<-"C:/Users/Kevin/Documents/R/Projects/ExploratoryDataAnalysis"
setwd(datadir) # set to data directory
setwd(initialdir) # sets back to home directory

# Assigning column names and class
colheaders<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
              "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colclass<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

# creates DF for required dates
hhpc<-read.table("household_power_consumption.txt",nrow=2879,skip=66636,sep=";",header=T,
                 na.strings = c("?","","NA"),colClasses = colclass,col.names = colheaders)

# adds date&time col, formats to date/time
hhpc$Date<-as.Date(hhpc$Date,"%d/%m/%Y")
class(hhpc$Date) #check
hhpc$DateTime<-paste(hhpc$Date,hhpc$Time)
class(hhpc$DateTime) #check
hhpc$DateTime<-as.POSIXct(hhpc$DateTime)

# Section 2
# Plot 2
with(hhpc,plot(hhpc$DateTime,hhpc$Global_active_power,type = "l"
               ,ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="Plot2.png",width=480,height=480)
dev.off()

