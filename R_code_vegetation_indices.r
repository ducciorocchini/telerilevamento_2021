# R_code_vegetation_indices.r

library(raster) # require(raster)
library(RStoolbox) # for vegetation indices calculation 
# install.packages("rasterdiv")
library(rasterdiv) # for the worldwide NDVI
# install.packages("rasterVis")
library(rasterVis)


setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# b1 = NIR, b2 = red, b3 = green

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

defor1

# difference vegetation index

# time 1
dvi1 <- defor1$defor1.1 - defor1$defor1.2

# dev.off()
plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme

plot(dvi1, col=cl, main="DVI at time 1")

# time 2
dvi2 <- defor2$defor2.1 - defor2$defor2.2

plot(dvi2, col=cl, main="DVI at time 2")

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

difdvi <- dvi1 - dvi2

# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)


# ndvi
# (NIR-RED) / (NIR+RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl)

# ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
# plot(ndvi1, col=cl)

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2, col=cl)

# ndvi1 <- dvi2 / (defor2$defor2.1 + defor1$defor2.2)
# plot(ndvi2, col=cl)

difndvi <- ndvi1 - ndvi2

# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)


# RStoolbox::spectralIndices
vi1 <- spectralIndices(defor1, green = 3, red = 2, nir = 1)
plot(vi1, col=cl)

vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
plot(vi2, col=cl)

# worldwide NDVI
plot(copNDVI)


# Pixels with values 253, 254 and 255 (water) will be set as NA’s.
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

# rasterVis package needed:
levelplot(copNDVI)







