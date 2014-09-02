data=read.table("household_power_consumption.txt",header=T,sep=";")
judge<-data[,1]=="1/2/2007"|data[,1]=="2/2/2007"
dataused=data[judge,]
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
plot(time,dataused[,7],type="l",ylab="Energy sub metering",xlab="")
lines(time,dataused[,8],col="red")
lines(time,dataused[,9],col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=names(dataused[,7:9]))
dev.copy(png,file="plot3.png")
dev.off()

#The weekdays in all the plots are shown in Chinese, though I have tried changing
#the system language and the R gui language. But the codes could create the correct
#plots as the reference if run on a English-based computer.
