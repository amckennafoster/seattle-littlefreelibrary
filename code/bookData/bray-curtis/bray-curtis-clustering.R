library(vegan)
library(stringr)

#https://stackoverflow.com/questions/51200770/bray-curtis-pairwise-analysis-in-r/51230143

#Bray Curtis value means high similarity if it is low. It is a dissimilarity measure



#--------------------This uses the proportion based on density-----------------------------------

# The density calc removes lfls with no vol (like Central1). So you can't use the percent file and density file together.
catdens <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/cat-density-collection.csv", encoding="UTF-8")
#datafram has 29 col, 27 are categories

#get rid of spaces in neighborhood names
catdens$neighborhood<-str_replace_all(catdens$neighborhood, c(" " = ".")) 

#check variance of columns
library(dplyr)
catdens %>% summarise_if(is.numeric, var)
#since there is a wide range in variance, use the total method to calculate percentages

#Convert the densities to percentages of the max density in each LFL
catdensper<-catdens[,3:28] #col 2 to 28
catdensper <- decostand(catdensper, method='total')


#Set up percent data for dissimilarity and clustering
braycurtis <- vegdist(catdensper) 

#Look at dissimilarity within a neighborhood:
as.matrix(braycurtis)[catrel$neighborhood=="Central.District",catrel$neighborhood=="Central.District"]
as.dist(as.matrix(braycurtis)[catrel$neighborhood=="Central.District",catrel$neighborhood=="Central.District"]) 

#Now by neighborhood
meandist(braycurtis, catrel$neighborhood)
heatmap(as.matrix(braycurtis, catrel$neighborhood))
heatmap(as.matrix(meandist(braycurtis, catrel$neighborhood)))

#http://strata.uga.edu/8370/lecturenotes/clusterAnalysis.html
#Apparently best to use proportional data here
library(cluster)
rownames(catdensper) <- catdens$lflname #rename rows
bray <- vegdist(catdensper)
brayAgnes <- agnes(bray, method='ward') #other options: average (default), single (min), complete (max) and others...
#names(brayAgnes)
#This chart shows there is no clustering by neighborhood
plot(brayAgnes, which.plots = 2, main='book assemblage by genre', cex=0.5)
abline(h=1, col='red') #Chose h=1 arbitrarily

#Look at what is driving the clustering: Actually, this might only work if your original data is counts, then you convert to proportions for above and then use counts to get category percentages
#Get row numbers for bounding lfls
cluster1 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict2') : which(brayAgnes$order.lab=='Montlake6')]
cluster2 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict5') : which(brayAgnes$order.lab=='Montlake2')]
cluster3 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict3') : which(brayAgnes$order.lab=='Laurelhurst3')]
cluster4 <- brayAgnes$order [which(brayAgnes$order.lab=='Laurelhurst1') : which(brayAgnes$order.lab=='Northgate4')]
#Look at subclusters in cluster3
cluster5 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict3') : which(brayAgnes$order.lab=='QueenAnne2')]
cluster6 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict4') : which(brayAgnes$order.lab=='Laurelhurst3')]

catdenstrimmed<-catdens[,3:28]

cluster1lfl <- catdenstrimmed[cluster1, ]
cluster2lfl <- catdenstrimmed[cluster2, ]
cluster3lfl <- catdenstrimmed[cluster3, ]
cluster4lfl <- catdenstrimmed[cluster4, ]
cluster5lfl <- catdenstrimmed[cluster5, ]
cluster6lfl <- catdenstrimmed[cluster6, ]

round(sort(colSums(cluster1lfl) / sum(colSums(cluster1lfl)), decreasing=TRUE), digits=2) #Novels
round(sort(colSums(cluster2lfl) / sum(colSums(cluster2lfl)), decreasing=TRUE), digits=2) #Cookery
round(sort(colSums(cluster3lfl) / sum(colSums(cluster3lfl)), decreasing=TRUE), digits=2) #Childrens
round(sort(colSums(cluster4lfl) / sum(colSums(cluster4lfl)), decreasing=TRUE), digits=2) #Mystery and Novels
round(sort(colSums(cluster5lfl) / sum(colSums(cluster5lfl)), decreasing=TRUE), digits=2) #Children's and Novels
round(sort(colSums(cluster6lfl) / sum(colSums(cluster6lfl)), decreasing=TRUE), digits=2) #Children's and SciFi


#http://environmentalcomputing.net/cluster-analysis/
#This is Euclidean distance. Maybe not appropriate?
catrel2 <- catrel[,3:28]
rownames(catrel2) <- catrel$lflname
lfl.sim <- dist(catrel2, method = "euclidean")
lfl.cluster <- hclust(lfl.sim, method = "single")
plot(lfl.cluster)
