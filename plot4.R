##Across the United States, how have emissions from coal
##combustion-related sources changed from 1999–2008?

coal_SCC <- SCC[grep("*coal*|*Coal*",SCC$Short.Name),]$SCC
coal_data <- NEI[NEI$SCC %in% coal_SCC,]

suppressWarnings(agg_coal <- aggregate(coal_data, list(coal_data$year), mean))
png("plot4.png", width=600, height=600)

g2 <- ggplot(agg_coal, aes(x=Group.1, y=Emissions, group =1)) + geom_point(aes(colour = factor(Group.1)), size = 4)+geom_line()
g2
dev.off()