# My frst code in R for remote sensing!!!
# Il mio primo codice in R per il telerilevamento!

# install.packages("raster")
library(raster)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

plot(p224r63_2011)

# colour change
cl <- colorRampPalette(c("black","grey","light grey")) (100) 
plot(p224r63_2011, col=cl)
                       
# colour change -> new
cl <- colorRampPalette(c("blue","green","grey","red","magenta","yellow")) (100) 
plot(p224r63_2011, col=cl)

cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011, col=cls)                       
