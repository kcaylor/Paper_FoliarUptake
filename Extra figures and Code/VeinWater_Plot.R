library(sp) 
library(raster)
library(rgdal)
library(rgeos)
library(gdalUtils)
library(igraph)
library(iterators)
library(foreach)
library(gridExtra) 
#library(EBImage) 
library(RGraphics)
library(pixmap)
library(ggplot2)



setwd("/Users/cgerlein/Desktop/Summer2014/Foliar_Uptake/Dryout_experiment/cleaned_up")
meat = c(64.23, 61.05, 61.10, 64.25, 57.25, 62.48);
veins = 100-meat;
wetweight = c(11.91, 55.87, 36.72, 2.5, 60.88, 31.35)

#Stacked Bar Plot with Colors and Legend
counts <- table(meat, veins)
barplot(counts, beside = FALSE, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(wetweight))


data <- read.table(text = "11.91 55.87 36.72 2.5 60.88 31.35  
1 64.23 61.05 61.10 64.25 57.25 62.48
2 35.77 38.95 38.90 35.75 42.75 37.52
", header = TRUE)

library(reshape2)

data2 <- melt(data)
row <- rep(1:2,length=nrow(data2))
df <- cbind(data2, row)

library(ggplot2)

ggplot(df, aes(x=variable, y=value, fill=row)) + 
  geom_bar(stat="identity") +
  xlab("\nType") +
  ylab("Time\n") +
  guides(fill=FALSE) +
  theme_bw()