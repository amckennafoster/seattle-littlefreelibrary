#load vegan
library("vegan", lib.loc="~/R/win-library/3.5")


#https://peat-clark.github.io/BIO381/veganTutorial.html

#Bray curtis assumes equal area or volume
#http://www.econ.upf.edu/~michael/stanford/maeb5.pdf

#Create dataframe for averages
avgs <- data.frame(Comparison=character(),
                 Avg=integer(),
                 stringsAsFactors=FALSE)


#---------------------CENTRAL--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/Central.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Central",avg))


write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/central.txt", sep="\t")
#detach(cat)



#---------------------Columbia--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/Columbia.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Columbia",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/columbia.txt", sep="\t")

#---------------------Laurel--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/Laurel.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Laurelhurst",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/laurel.txt", sep="\t")

#---------------------Mont--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/Mont.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Montlake",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/Mont.txt", sep="\t")

#---------------------North--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/North.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.
cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("North",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/North.txt", sep="\t")

#---------------------Phinn--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/Phinn.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Phinney-ridge",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/phinn.txt", sep="\t")

#---------------------Queen--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/Queen.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Queen-ann",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/queen.txt", sep="\t")

#---------------------Raven--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/Raven.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Ravenna",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/raven.txt", sep="\t")

#---------------------Neighborhoods--------------------------------
#Import File
catrel <- read.csv("~/GitHub/seattle-littlefreelibrary/code/bookData/neighborhood-cats-bray-curtis.csv", encoding="UTF-8")
#If weird characters are inserted in first column, open csv in notepad++ and change encoding from 
#UTF-8-BOM to UTF-8.

cat<-data.frame(catrel)
#attach(cat)
#Deleting the first column
cat <- subset(cat, select = -c(category1))

#Transposed the table
cat<-t(cat) #This transposes and makes negative?????
#Calculate dissimilarity
braycurtis = vegdist(cat, "bray")
braycurtis
#Put it in a matrix
braycurtismatrix<-as.matrix (braycurtis)
braycurtismatrix
avg<-mean(braycurtismatrix)
avgs <- rbind(avgs, c("Neighborhoods",avg))

write.table(braycurtismatrix, "C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/neighborhoods.txt", sep="\t")

#---------------------------------SAVE THE AVERAGES TABLE---------------------

write.csv(avgs,"C:/Users/Andre/Documents/GitHub/seattle-littlefreelibrary/code/bookData/bray-curtis/avgpercents.csv")

