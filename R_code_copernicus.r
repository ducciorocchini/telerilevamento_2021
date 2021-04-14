# R_code_copernicus.r
# Visualizing Copernicus data

# install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

albedo <- raster("c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc")

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) # 
plot(albed0, col=cl)

# resampling
albedores <- aggregate(albedo, fact=100)
plot(albedores, col=cl)
