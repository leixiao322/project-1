data=read.table("household_power_consumption.txt",header=T,sep=";")
judge<-data[,1]=="1/2/2007"|data[,1]=="2/2/2007"
dataused=data[judge,]
dataused[,3]=as.character(dataused[,3])
dataused[,3]=as.numeric(dataused[,3])
dataused[,1]=as.character(dataused[,1])
dataused[,2]=as.character(dataused[,2])
dataused[,1]=paste(dataused[,1],dataused[,2])
time=strptime(dataused[,1],format="%d/%m/%Y %H:%M:%S")
plot(time,dataused[,3],type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()

#The weekdays in all the plots are shown in Chinese, though I have tried changing
#the system language and the R gui language. But the codes could create the correct
#plots as the reference if run on a English-based computer.