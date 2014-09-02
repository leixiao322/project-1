data=read.table("household_power_consumption.txt",header=T,sep=";")
judge<-data[,1]=="1/2/2007"|data[,1]=="2/2/2007"
dataused=data[judge,]
dataused[,3]=as.character(dataused[,3])
dataused[,3]=as.numeric(dataused[,3])
dataused[,4]=as.character(dataused[,4])
dataused[,4]=as.numeric(dataused[,4])
dataused[,5]=as.character(dataused[,5])
dataused[,5]=as.numeric(dataused[,5])
dataused[,7]=as.character(dataused[,7])
dataused[,7]=as.numeric(dataused[,7])
dataused[,8]=as.character(dataused[,8])
dataused[,8]=as.numeric(dataused[,8])
dataused[,9]=as.character(dataused[,9])
dataused[,9]=as.numeric(dataused[,9])
dataused[,1]=as.character(dataused[,1])
dataused[,2]=as.character(dataused[,2])
dataused[,1]=paste(dataused[,1],dataused[,2])
time=strptime(dataused[,1],format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(time,dataused[,3],type="l",ylab="Global Active Power(kilowatts)",xlab="")
plot(time,dataused[,5],type="l",ylab="Voltage",xlab="datetime")
plot(time,dataused[,7],type="l",ylab="Energy sub metering",xlab="")
lines(time,dataused[,8],col="red")
lines(time,dataused[,9],col="blue")
plot(time,dataused[,4],type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png")
dev.off()

#The weekdays in all the plots are shown in Chinese, though I have tried changing
#the system language and the R gui language. But the codes could create the correct
#plots as the reference if run on a English-based computer.