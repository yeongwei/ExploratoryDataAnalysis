###############################################################################
## Have total emissions from PM2.5 decreased in the United States from 1999 to
## 2008? Using the base plotting system, make a plot showing the total PM2.5 
## emission from all sources for each of the years 1999, 2002, 2005, and 2008.
###############################################################################

NEI <- readRDS("summarySCC_PM25.rds")
SUBSET <- NEI[, c("year", "Emissions")]  
AGG <- aggregate(Emissions ~ year, SUBSET, FUN = sum)

png("plot1.png")
barplot(
  height = AGG$Emissions, 
  names.arg = AGG$year,
  xlab = "Year",
  ylab = "Sum of PM2.5 Emissions",
  main = "Sum of PM2.5 Emissions over Year")
dev.off()