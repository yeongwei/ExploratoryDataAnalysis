###############################################################################
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"
## ). Which city has seen greater changes over time in motor vehicle emissions?
###############################################################################

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

SUBSET <- NEI[
  (NEI$fips == "24510" | NEI$fips == "06037") & NEI$type=="ON-ROAD", 
  c("year", "Emissions", "fips")]
AGG <- aggregate(Emissions ~ year + fips, SUBSET, sum)

AGG$fips[AGG$fips == "24510"] <- "Baltimore"
AGG$fips[AGG$fips == "06037"] <- "Los Angeles"

png("plot6.png")
PLOT <- ggplot(AGG, aes(factor(year), Emissions)) +
  facet_grid(. ~ fips) +
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions for Motor Vehicle in Baltimore and Los Angeles")
print(PLOT)
dev.off()