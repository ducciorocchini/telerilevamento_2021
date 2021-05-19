# R_code_variability.r

library(raster)
library(RStoolbox)
# install.packages("RStoolbox")

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

sent <- brick("sentinel.png")

# NIR 1, RED 2, GREEN 3
# r=1, g=2, b=3
plotRGB(sent, stretch="lin") 
# plotRGB(sent, r=1, g=2, b=3, stretch="lin") 

plotRGB(sent, r=2, g=1, b=3, stretch="lin") 

nir <- sent$sentinel.1
red <- sent$sentinel.2

ndvi <- (nir-red) / (nir+red)
plot(ndvi)
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
plot(ndvi,col=cl)

ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd3, col=clsd)

# mean ndvi with focal
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvimean3, col=clsd)


ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd13, col=clsd)




