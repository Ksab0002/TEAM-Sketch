Registration <- read.csv('D:\\Data Science sm2\\FIT5120\\datasets\\Registrations_Master_Vic.csv')
ta <- as.data.frame(summary(Registration$Breed_Description_primary))
ta[,2] <- ta[,1]
ta[,1] <- rownames(ta)
colnames(ta)[1] <- 'breeds'
ta <- ta[-100,]
ta<- ta[-7,]
ta <-ta[-c(1,2,3),]
rownames(ta)<-1:95
ta <- ta[-c(9,17,22,42,50,67),]
wordcloud2(ta,color = "random-light", backgroundColor = "white",size=0.15,shape = 'cicrle')