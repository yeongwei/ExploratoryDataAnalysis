###############################################################################
## Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system
## to make a plot answering this question.
###############################################################################

NEI <- readRDS("summarySCC_PM25.rds")
SUBSET <- NEI[NEI$fips == "24510", c("year", "Emissions")]  
AGG <- aggregate(Emissions ~ year, SUBSET, FUN = sum)

png("plot2.png")
barplot(
  height = AGG$Emissions, 
  names.arg = AGG$year,
  xlab = "Year",
  ylab = "Sum of PM2.5 Emissions",
  main = "Sum of PM2.5 Emissions over Year for Baltimore City")
dev.off()