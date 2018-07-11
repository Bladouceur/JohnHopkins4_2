# John Hopkins Data Science Track
# Course 4 Exploratory Data Analysis
# By Benoit Ladouceur

# Plot 5

rm(list = ls()) # Clean up
setwd("C:/Users/Benoit/Documents") # set WD

NEI <- readRDS("summarySCC_PM25.rds")# Load
SCC <- readRDS("Source_Classification_Code.rds")

# First we prepare the data, we are still relying on grpe1 
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]
baltimoreVehicleNEI <- vehicleNEI[vehicleNEI$fips==24510,] #city

# then we plot
library(ggplot2)
gg <- ggplot(baltimoreVehicleNEI,aes(factor(year),Emissions)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_fivethirtyeight() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore from 1999 to 2008"))

print(gg)
