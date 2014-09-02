data=read.table("household_power_consumption.txt",header=T,sep=";")
judge<-data[,1]=="1/2/2007"|data[,1]=="2/2/2007"
dataused=data[judge,]
dataused[,3]=as.character(dataused[,3])
dataused[,3]=as.numeric(dataused[,3])
hist(dataused[,3],main="Global Active Power",col="red",
     xlab="Global Active Power(kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
