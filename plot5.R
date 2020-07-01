##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
vehicle_SCC <- SCC[grep("*vehicle*|*Vehicle*",SCC$Short.Name),]$SCC
motor_balt <- balt[balt$SCC %in% vehicle_SCC,]
agg_motor_balt <- aggregate(motor_balt$Emissions, list(motor_balt$year),mean)
png("plot5.png", width=600, height=600)

g3 <- ggplot(agg_motor_balt, aes(x=Group.1, y=x, group =1)) + geom_point(aes(colour = factor(Group.1)), size = 4)+geom_line()
g3
dev.off()