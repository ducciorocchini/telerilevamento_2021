# R_code_classification.r

setwd("~/lab")
library(raster)
library(RStoolbox)

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so

plotRGB(so, 1,2,3, stretch="lin")

soc <- unsuperClass(so, nClasses=3)
plot(soc$map)

soc20 <- unsuperClass(so, nClasses=20)
plot(soe20$map,col=cl)

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soc20$map,col=cl)

# Download Solar Orbiter data and proceed further!
