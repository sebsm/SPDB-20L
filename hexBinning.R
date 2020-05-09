library(fMultivar)
library(readr)
library(ggplot2)
library(maps)
library(GISTools)
## squareBinning -
sB <- squareBinning(x = mydata_cliwoc$Lon3, y = mydata_cliwoc$Lat3)
plot(sB)
## hexBinning -
hB <- hexBinning(x = mydata_cliwoc$Lon3, y = mydata_cliwoc$Lat3)
plot(hB)