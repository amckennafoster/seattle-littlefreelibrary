library(vegan)
library(stringr)

#https://stackoverflow.com/questions/51200770/bray-curtis-pairwise-analysis-in-r/51230143

#Bray Curtis value means high similarity if it is low. It is a dissimilarity measure


catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/cat-percent-collection.csv", encoding="UTF-8")
#datafram has 29 col, 27 are categories

#get rid of spaces in neighborhood names
catrel$neighborhood<-str_replace_all(catrel$neighborhood, c(" " = ".")) 

                                      
braycurtis <- vegdist(catrel[,3:28]) #col 2 to 28


as.matrix(braycurtis)[catrel$neighborhood=="Central.District",catrel$neighborhood=="Central.District"]
as.dist(as.matrix(braycurtis)[catrel$neighborhood=="Central.District",catrel$neighborhood=="Central.District"]) 

meandist(braycurtis, catrel$neighborhood)
heatmap(as.matrix(braycurtis, catrel$neighborhood))

#http://strata.uga.edu/8370/lecturenotes/clusterAnalysis.html
#Apparently best to use proportional data here
library(cluster)
catcluster <- catrel[,3:28]
rownames(catcluster) <- catrel$lflname #rename rows
bray <- vegdist(catcluster)
brayAgnes <- agnes(bray, method='ward')
#names(brayAgnes)
#This chart shows there is no clustering by neighborhood
plot(brayAgnes, which.plots = 2, main='book assemblage', cex=0.5)
abline(h=1, col='red') #Chose h=1 arbitrarily

#Look at what is driving the clustering: Actually, this might only work if your original data is counts, then you convert to proportions for above and then use counts to get category percentages
#Get row numbers for bounding lfls
cluster1 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict1') : which(brayAgnes$order.lab=='Montlake6')]
cluster2 <- brayAgnes$order [which(brayAgnes$order.lab=='Laurelhurst1') : which(brayAgnes$order.lab=='Northgate4')]
cluster3 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict5') : which(brayAgnes$order.lab=='Montlake2')]
cluster4 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict3') : which(brayAgnes$order.lab=='Ravenna5')]
cluster1lfl <- catcluster[cluster1, ]
cluster2lfl <- catcluster[cluster2, ]
cluster3lfl <- catcluster[cluster3, ]
cluster4lfl <- catcluster[cluster4, ]

round(sort(colSums(cluster1lfl) / sum(colSums(cluster1lfl)), decreasing=TRUE), digits=2) #looks like novels
round(sort(colSums(cluster2lfl) / sum(colSums(cluster2lfl)), decreasing=TRUE), digits=2) #Mystery
round(sort(colSums(cluster3lfl) / sum(colSums(cluster3lfl)), decreasing=TRUE), digits=2) #Cookery
round(sort(colSums(cluster4lfl) / sum(colSums(cluster4lfl)), decreasing=TRUE), digits=2) #Childrens

#http://environmentalcomputing.net/cluster-analysis/
#This is Euclidean distance. Maybe not appropriate?
catrel2 <- catrel[,3:28]
rownames(catrel2) <- catrel$lflname
lfl.sim <- dist(catrel2, method = "euclidean")
lfl.cluster <- hclust(lfl.sim, method = "single")
plot(lfl.cluster)
