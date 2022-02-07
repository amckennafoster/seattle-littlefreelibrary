library(vegan)
library(stringr)

#https://stackoverflow.com/questions/51200770/bray-curtis-pairwise-analysis-in-r/51230143

#Bray Curtis value means high similarity if it is low. It is a dissimilarity measure



#--------------------This uses the proportion based on density-----------------------------------

# The density calc removes lfls with no vol (like Central1). So you can't use the percent file and density file together.
catdens <- read.csv("~/GitHub/seattle-littlefreelibrary/analysis/bookData/cluster/cat-density-collection.csv", encoding="UTF-8")
#datafram has 29 col, 27 are categories

#get rid of spaces in neighborhood names
catdens$neighborhood<-str_replace_all(catdens$neighborhood, c(" " = ".")) 

#check variance of columns
library(dplyr)
catdens %>% summarise_if(is.numeric, var)
#since there is a wide range in variance, use the total method to calculate percentages

#Convert the densities to percentages of the max density in each LFL. This reduces the influence of one category
#with a wide range in percent. Now all categories will range from zero to 1.
catdensper <- catdens[,3:34] #get the columns of categories
catdensper <- decostand(catdensper, method='total')

#http://strata.uga.edu/8370/lecturenotes/clusterAnalysis.html
library(cluster)
rownames(catdensper) <- catdens$lflname #rename rows
bray <- vegdist(catdensper)
brayAgnes <- agnes(bray, diss = TRUE, method='ward') #other options: average (default), single (min), complete (max) and others...

#Produce a simple dendrogram and add a line (use pltree to put all labels on x axis)
plot(brayAgnes, which.plots = 2, main='', cex=0.7)
abline(h=1, col='red') #Chose h=1 arbitrarily

#setEPS()
#postscript("../../figures/cluster.eps")
#plot(brayAgnes, which.plots = 2, main='', cex=0.7)
#rect.hclust(brayAgnes, k = 4, border = 3:6)
#dev.off()

#plot a dendrogram with boxes around clusters
library(dendextend)

dend <- brayAgnes %>% as.dendrogram %>% hang.dendrogram
par(mar = c(10,2,1,1)) #control the margins (bottom, left, top, right)
par(oma = c(3,1,1,1)) #control the margins (bottom, left, top, right)
par(cex=0.6) #Text size of labels
dend %>% plot #If you want colors on the branches: dend %>% color_branches(k=4) %>% plot
dend %>% rect.dendrogram(k=2)


#Build the plot and save as eps
setEPS()
postscript("../../figures/cluster.eps")
dend %>% plot #If you want colors on the branches: dend %>% color_branches(k=4) %>% plot
dend %>% rect.dendrogram(k=2)
dev.off()


#---------------------------
#Look at what is driving the clustering: This ranks the genres for each cluster. 
#Get row numbers for bounding lfls
cluster1 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict2') : which(brayAgnes$order.lab=='ColumbiaCity5')]
cluster2 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict3') : which(brayAgnes$order.lab=='Ravenna3')]
#small cluster within cluster 1
cluster3 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict5') : which(brayAgnes$order.lab=='ColumbiaCity5')]
#left cluster in cluster 2
cluster4 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict3') : which(brayAgnes$order.lab=='Ravenna1')]
#right cluster in cluster 2
cluster5 <- brayAgnes$order [which(brayAgnes$order.lab=='CentralDistrict4') : which(brayAgnes$order.lab=='Ravenna3')]
#cluster6 <- brayAgnes$order [which(brayAgnes$order.lab=='Phinney-Green3') : which(brayAgnes$order.lab=='QueenAnne1')] #second group


catdenstrimmed<-catdens[,3:34]

cluster1lfl <- catdenstrimmed[cluster1, ]
cluster2lfl <- catdenstrimmed[cluster2, ]
cluster3lfl <- catdenstrimmed[cluster3, ]
cluster4lfl <- catdenstrimmed[cluster4, ]
cluster5lfl <- catdenstrimmed[cluster5, ]
#cluster6lfl <- catdenstrimmed[cluster6, ]

#Generally, categories over 0.10 are noted
round(sort(colSums(cluster1lfl) / sum(colSums(cluster1lfl)), decreasing=TRUE), digits=2) #Mystery and Selfhelp Large group left
round(sort(colSums(cluster2lfl) / sum(colSums(cluster2lfl)), decreasing=TRUE), digits=2) #Childrens and mystery Large group right
round(sort(colSums(cluster3lfl) / sum(colSums(cluster3lfl)), decreasing=TRUE), digits=2) #Biography/Autobio, History, self help, hist fiction Central5 group
round(sort(colSums(cluster4lfl) / sum(colSums(cluster4lfl)), decreasing=TRUE), digits=2) #Childrens, mystery left subgroup in right
round(sort(colSums(cluster5lfl) / sum(colSums(cluster5lfl)), decreasing=TRUE), digits=2) #Childrens then scifi right subgroup in right
#round(sort(colSums(cluster6lfl) / sum(colSums(cluster6lfl)), decreasing=TRUE), digits=2) #Mystery and selfhelp


#Create an ordination chart
#From: https://www.r-bloggers.com/2017/12/how-to-perform-hierarchical-clustering-using-r/
clust <- cutree(as.hclust(brayAgnes), h=1.3) #This gets the output from agnes into the right form for cutree.
#Use factoextra to create an ordination plot
library(factoextra)
fviz_cluster(list(data = bray, cluster = clust))



