
##Have total emissions from PM2.5 decreased in the Baltimore City,
##Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510")
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.


NEI <- transform(NEI, SCC = factor(SCC))
NEI <- transform(NEI, year = factor(year))

#baltimore and totalling by year
balt <- NEI[which(NEI$fips == 24510),]
tbal <- aggregate(Emissions ~ year,balt, sum)
png("plot2.png", width=600, height=600)

barplot(tbal$Emissions, xlab="Year", ylab="PM2.5 Emissions", main = "Baltimore PM2.5 Emission Totals", names.arg = tbal$year)
dev.off()