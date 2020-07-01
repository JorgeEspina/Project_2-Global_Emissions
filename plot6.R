##Compare emissions from motor vehicle sources in Baltimore City with emissions
##from motor vehicle sources in Los Angeles County, California
##(\color{red}{\verb|fips == "06037"|}fips == "06037").
##Which city has seen greater changes over time in motor vehicle emissions?

LA <- NEI[which(NEI$fips == "06037"),]
motor_LA <- LA[LA$SCC %in% vehicle_SCC,]
agg_motor_LA <- aggregate(motor_LA$Emissions, list(motor_LA$year),mean)
agg_motor_LA$city <- rep("LA",4)
agg_motor_balt$city <- rep("Baltimore",4)

two_cities <- rbind.data.frame(agg_motor_balt,agg_motor_LA)
png("plot6.png", width=600, height=600)


g4 <- ggplot(two_cities, aes(x=factor(Group.1), y=x, group =city)) + geom_point(aes(colour = city), size = 4)+geom_line(aes(colour=city))
g4
dev.off()