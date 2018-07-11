# John Hopkins Data Science Track
# Course 4 Exploratory Data Analysis
# By Benoit Ladouceur

# Plot 6
library(ggplot2)
library(ggthemes)
rm(list = ls()) # Clean up
setwd("C:/Users/Benoit/Documents") # set WD

NEI <- readRDS("summarySCC_PM25.rds")# Load
SCC <- readRDS("Source_Classification_Code.rds")

# First we prepare the data
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]
vehicleBaltimoreNEI <- vehicleNEI[vehicleNEI$fips == 24510,]#city
vehicleBaltimoreNEI$city <- "Baltimore City" #for ID later
vehicleLANEI <- vehicleNEI[vehicleNEI$fips=="06037",]#city
vehicleLANEI$city <- "Los Angeles County" # for ID later
groupped <- rbind(vehicleBaltimoreNEI,vehicleLANEI)

# Then we plot
gg <- ggplot(groupped, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        guides(fill=FALSE) + theme_pander() +
        facet_grid(scales="free", space="free", .~city) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore & Los Angeles, 1999 to 2008"))

print(gg)