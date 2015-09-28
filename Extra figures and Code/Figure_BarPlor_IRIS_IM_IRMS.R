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
library(extrafont)
require(tikzDevice)

loadfonts()

d18O_IRIS_IM = r(-12.7, -10.0, -9.3, -6.1,-16.1);
d18_IRIS_IMCor_vein = r(-3.2,-2.4,-3.4,0.0,-6.4);
dD_IRIS_IM=r(-27.8,-28.9,-9.5,-0.6,-21.9);
dD_IRIS_IMCor_vein=r(-4.2,-6.8,-2.9,6.6,-8.7);

d18O=rbind(d18O_IRIS_IM,d18_IRIS_IMCor_vein)
barplot(d18O, width = 1, main=expression(delta ^{18} O), col=c("darkblue","red"),beside=TRUE)



