###############################################################################
## Of the four types of sources indicated by the type(point, nonpoint, onroad, 
## nonroad) variable, which of these four sources have seen decreases in 
## emissions from 1999-2008 for Baltimore City? Which have seen increases in 
## emissions from 1999-2008? Use the ggplot2 plotting system to make a plot 
## answer this question.
###############################################################################

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SUBSET <- NEI[NEI$fips == "24510", c("year", "Emissions", "type")]  
AGG <- aggregate(Emissions ~ year + type, SUBSET, FUN = sum)

png("plot3.png")
PLOT <- ggplot(AGG, aes(year, Emissions, color = type)) +
  geom_line() +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions for Baltimore City by Type")
print(PLOT)
dev.off()