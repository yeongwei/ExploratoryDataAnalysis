###############################################################################
## How have emissions from motor vehicle sources changed from 1999-2008 in
## Baltimore City?
###############################################################################

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

SUBSET <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", c("year", "Emissions")]  
AGG <- aggregate(Emissions ~ year, SUBSET, sum)

png("plot5.png")
PLOT <- ggplot(AGG, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions from Motor Vehicle for Baltimore City")
print(PLOT)
dev.off()
