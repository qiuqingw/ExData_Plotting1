library(dplyr)
getwd()
dir()
ls()
rm(ls())
system.time({hpcdata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)}) 
View(hpcdata_2)
summary(hpcdata)
head(hpcdata_1)
str(hpcdata_2)

char_columns <- sapply(hpcdata, is.character) # Check how many character variables in the hpc dataset.
hpcdata_num <- as.data.frame(apply(hpcdata[,3:9], 2, as.numeric)) # Convert the character variables into numeric ones.
str(hpcdata_num)
View(hpcdata_num)
names(hpcdata_num)
hpcdata_1 <- cbind(hpcdata[1:2],hpcdata_num)
hpcdata_1 <- data.frame(hpcdata_1)
hpcdata_2 <- hpcdata_1[hpcdata_1$Date %in% c("1/2/2007","2/2/2007") ,] #Select data from the dates 2007-02-01 and 2007-02-02.
table(hpcdata_2$Date)

#Create plot 1
hist(hpcdata_2[,3], xlab = "Global Active Power (kilowatts)", col = "Red", main = "Global Active Power")
dev.copy(png, file = "plot 1.png")
dev.off()