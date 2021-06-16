# R_code_spectral_signatures.r

library(raster)
library(rgdal)
library(ggplot2)

setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

defor2 <- brick("defor2.jpg")

# defor2.1, defor2.2, defor2.3 
# NIR, red, green

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="hist")

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

# results:
#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 178.5 435.5 30293      206        6       19
#      x     y   cell defor2.1 defor2.2 defor2.3
# 1 571.5 245.5 166916       40       99      139

# define the columns of the dataset:
band <- c(1,2,3)
forest <- c(206,6,19)
water <- c(40,99,139)

# create the dataframe
spectrals <- data.frame(band, forest, water)

# plot the sepctral signatures
ggplot(spectrals, aes(x=band)) +
 geom_line(aes(y=forest), color="green") +
 geom_line(aes(y=water), color="blue") +
 labs(x="band",y="reflectance")

############### Multitemporal

defor1 <- brick("defor1.jpg")

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

# spectral signatures defor1
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 89.5 339.5 98622      223       11       33
#     x     y   cell defor1.1 defor1.2 defor1.3
# 1 42.5 336.5 100717      218       16       38
#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 64.5 341.5 97169      213       36       46
#      x     y   cell defor1.1 defor1.2 defor1.3
# 1 80.5 326.5 107895      208        2       22
#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 76.5 374.5 73619      224       21       41

# time t2
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 86.5 339.5 99033      197      163      151
#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 104.5 338.5 99768      149      157      133
#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 110.5 354.5 88302      197      132      128
#     x     y   cell defor2.1 defor2.2 defor2.3
# 1 90.5 320.5 112660      169      166      149
#    x     y   cell defor2.1 defor2.2 defor2.3
# 1 97.5 309.5 120554      150      137      129

# define the columns of the dataset:
band <- c(1,2,3)
time1 <- c(223,11,33)
time1p2 <- c(218,16,38)
time2 <- c(197,163,151)
time2p2 <- c(149,157,133)

spectralst <- data.frame(band, time1, time2, time1p2, time2p2)


# plot the sepctral signatures
ggplot(spectralst, aes(x=band)) +
 geom_line(aes(y=time1), color="red", linetype="dotted") +
 geom_line(aes(y=time1p2), color="red", linetype="dotted") +
 geom_line(aes(y=time2), linetype="dotted") +
 geom_line(aes(y=time2p2), linetype="dotted") +
 labs(x="band",y="reflectance")

# image from Earth Observatory

eo <- brick("june_puzzler.jpg")
plotRGB(eo, 1,2,3, stretch="hist")
click(eo, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

# output
#     x     y  cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 93.5 373.5 76414            187            163             11
#      x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 219.5 285.5 139900             11            140              0
#     x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 184.5 315.5 118265             41             40             20


# define the columns of the dataset:
band <- c(1,2,3)
stratum1 <- c(187,163,11)
stratum2 <- c(11,140,0)
stratum3 <- c(41,40,20)

spectralsg <- data.frame(band, stratum1, stratum2, stratum3)

# plot the sepctral signatures
ggplot(spectralsg, aes(x=band)) +
 geom_line(aes(y=stratum1), color="yellow") +
 geom_line(aes(y=stratum2), color="green") +
 geom_line(aes(y=stratum3), color="blue") +
 labs(x="band",y="reflectance")









