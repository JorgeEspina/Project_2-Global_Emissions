fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, "Summary.zip", method = "curl")
unzip(zipfile = "Summary.zip")
unlink("Summary.zip")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Have total emissions from PM2.5 decreased in the United States 
##from 1999 to 2008? Using the base plotting system, make a plot 
##showing the total PM2.5 emission from all sources for each of the 
##years 1999, 2002, 2005, and 2008.

NEI <- transform(NEI, SCC = factor(SCC))
NEI <- transform(NEI, year = factor(year))

#Emissions by SCC and year
totals <- aggregate(Emissions ~ year,NEI, sum)
png("plot1.png", width=600, height=600)

barplot(totals$Emissions, xlab="Year", ylab="PM2.5 Emissions", main = "PM2.5 Emission Totals", names.arg = totals$year)
dev.off()
