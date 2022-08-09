#Rayanh Gutierrez
#EVE 109 
#11/1/2019  
#Week 6 


###Answer to Q1 
#read in genotypes and metadata csv 

meta <- read.csv("/Users/rayanhg/Desktop/R_data/wk6_metadata.csv") 

genofile <- read.csv("/Users/rayanhg/Desktop/R_data/wk6_genotypes.csv")

IDs <- genofile[,1]#subsetting only IDs in genofile

genos <- genofile[,2:ncol(genofile)]#subsetting only genotypes in genofile

#reorder metadata so samples are in same order as genotype  

ordermeta <- meta[match(IDs,meta$ID),]

###Answer to Q2 
#write a function that returns the proportions of data for each individual that is missing 

ourfunction <- function(x) { #using which command to subset WITH missing data
  top <- length(which(is.na(x)))   #the length command tells us how long the vector is 
  bottom <- length(x)
  metric <- top/bottom  #dividing the missing data by the number of indivduals 
  return(metric)} #return metric tells the function to return top/bottom

miss <- apply(ordermeta,1,ourfunction) #applying our function to each row 

f <- summary(miss)

print (f)  #printing summary 

###Answer to Q3 
#create a colored pca 
subgen <- na.omit(genos) #removing indivduals that have missing data
head(subgen)


#subsetting the metadata to match also b/c subset the genos file  
submeta <- ordermeta[complete.cases(genos),]
head(submeta)

#Calculating the PCA and plot it 
pca <- prcomp(subgen) #use pca to look at similarity among individuals 
plot(pca$x) 

#changing column type since R 4.0 changed default handling of read.table
submeta$River = as.factor(submeta$River)

#categorize the dots and color by river 
plot(pca$x,col=submeta$River,pch=19)
legend("topright", legend=levels(submeta$River), pch=19, col=1:nlevels(submeta$River),cex=0.5)

