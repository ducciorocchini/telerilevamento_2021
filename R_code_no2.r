# R_code_no2.r
library(raster)
library(RStoolbox) # here used for raster based multivariate analysis

# 1. Set the working directory EN

setwd("~/lab/EN") # Linux
# setwd("C:/lab/EN") # Windows
# setwd("/Users/name/Desktop/lab/EN") # Mac 

# 2. Import the first image (single band)
# we will select band 1, but the raster function enables to select other single-bands
# [suggerimento studenti]
# https://www.rdocumentation.org/packages/raster/versions/3.4-10/topics/raster

EN01 <- raster("EN_0001.png")

# 3. Plot the first importaed image with your preferred Color Ramp Palette

cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN01, col=cls)

# 4. Import the last image (13th) and plot it with the previous Color Ramp Palette

EN13 <- raster("EN_0013.png")

cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN13, col=cls)

# 5. Make the difrerence between the two images and plot it
# eith March - January or January - March
ENdif <- EN01 - EN13
plot(ENdif, col=cls)

# 6. Plot everything, altogether
par(mfrow=c(3,1))
plot(EN01, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (January - March)")

# 7. Import the whole set

# list of files:
rlist <- list.files(pattern="EN")
rlist

import <- lapply(rlist,raster)
import

EN <- stack(import)
plot(EN, col=cls)

# 8. Replicate the plot of images 1 and 13 using the stack
par(mfrow=c(2,1))
plot(EN$EN_0001, col=cls)
plot(EN$EN_0013, col=cls)

# 9. Compute a PCA over the 13 images

ENpca <- rasterPCA(EN)

summary(ENpca$model)

dev.off()
plotRGB(ENpca$map, r=1, g=2, b=3, stretch="lin")

# 10. Compute the local variability (local standard deviation) of the first PC
PC1sd <- focal(ENpca$map$PC1, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(PC1sd, col=cls)




