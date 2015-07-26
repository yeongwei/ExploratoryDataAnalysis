###############################################################################
## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999-2008?
###############################################################################

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- NEI[, c("Emissions", "year", "SCC")]
SCC <- SCC[, c("SCC", "Short.Name")]

MERGED <- merge(NEI, SCC, by = "SCC")
MATCHED <- MERGED[
  grep("coal", MERGED$Short.Name),
  c("Emissions", "year", "Short.Name")]
AGG <- aggregate(Emissions ~ year, MATCHED, sum)

png("plot4.png")
PLOT <- ggplot(AGG, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions from Coal Sources by Year")
print(PLOT)
dev.off()