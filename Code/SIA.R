library(raster)
library(sp)
library(dplyr)
library(tidyr)
library(rpart)


Img_Data<- brick('Raster_Img_Ind.tif')

Img_Data

plot(Img_Data)


crs(Img_Data)
nlayers(Img_Data)
res(Img_Data)
names(Img_Data)

library(dplyr)



subset_data<-subset(Img_Data, 1:8)
names(subset_data)

names(subset_data)<-c(1:8)
names(subset_data)
plot(subset_data)

(new_extent<-extent(235000, 260000,  -375000,  -370000))

(croped_Img<-crop(subset_data,new_extent))


plotRGB(croped_Img, r= 2, g = 8, b = 2,stretch ="lin",main="Vegetation")

ndvi<-(Img_Data[[7]] -Img_Data[[3]]) / (Img_Data[[7]] + Img_Data[[3]])

ndvi

plot(ndvi, col = rev(terrain.colors(6)), main = 'NDVI')
    
samp_ran <- sampleRandom(croped_Img, 20000)
pro<- prcomp(samp_ran   , scale = TRUE)
pred<- predict(croped_Img, pro, index = 1:2) 
pred

