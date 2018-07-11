# John Hopkins Data Science Track
# Course 4 Exploratory Data Analysis
# By Benoit Ladouceur

# Plot 3

rm(list = ls()) # Clean up
setwd("C:/Users/Benoit/Documents") # set WD
library(ggplot2) # load library
library(ggthemes)
NEI <- readRDS("summarySCC_PM25.rds")# Load
SCC <- readRDS("Source_Classification_Code.rds")

balNEI <- NEI[NEI$fips=="24510",]# Filter than Aggregate
aggSumBaltimore <- aggregate(Emissions ~ year, balNEI,sum)

gg <- ggplot(balNEI,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_economist() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions for Baltimore City from 1999 to 2008 by Source Type"))

gg