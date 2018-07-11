# John Hopkins Data Science Track
# Course 4 Exploratory Data Analysis
# By Benoit Ladouceur

# Plot 1

rm(list = ls()) # Clean up
setwd("C:/Users/Benoit/Documents") # set WD

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggSum <- aggregate(Emissions ~ year,NEI, sum)

barplot(
        (aggSum$Emissions)/10^6,
        names.arg=aggSum$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources",
        col="darkgreen"
)