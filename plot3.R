##Of the four types of sources indicated by the \color{red}{\verb|type|}type 
##(point, nonpoint, onroad, nonroad) variable, which of these four sources have 
##seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases
##in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer 
##this question.

agg_type_year <- aggregate(NEI$Emissions, list(NEI$type, NEI$year),mean)
png("plot3.png", width=600, height=600)

g <- ggplot(agg_type_year, aes(y=x, x=Group.2))+geom_point(aes(colour = factor(Group.1)), size = 4)
g+geom_line(aes(group=Group.1,colour=Group.1))
dev.off()