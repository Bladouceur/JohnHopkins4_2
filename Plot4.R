# John Hopkins Data Science Track
# Course 4 Exploratory Data Analysis
# By Benoit Ladouceur

# Plot 4

rm(list = ls()) # Clean up
setwd("C:/Users/Benoit/Documents") # set WD
library(ggplot2)
library(ggthemes)
NEI <- readRDS("summarySCC_PM25.rds")# Load
SCC <- readRDS("Source_Classification_Code.rds")

# First we need to prepare the data
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal  <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
CoalComb <- (combustion & coal)
combustionSCC <- SCC[CoalComb,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,] #common

# Then we can plot
gg <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_solarized() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions in US from 1999 to 2008"))
gg