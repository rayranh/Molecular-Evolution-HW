#Rayanh Gutierrez
#EVE 109 
#Week 9 
#11/22/2019

#install.packages("vcfR") 
#install.packages("hierfstat")
#install.packages("adegenet") 

library(vcfR) 
library(hierfstat)
library(adegenet)
library(pegas)
#most vcf common way to store snp data 
v <- read.vcfR( "/Users/rayanhg/Desktop/EVE109-Week9-master/data/snp_data.vcf")

# convert it to genind format  
gen <- vcfR2genind(v)#when we did heterozygosity the genind class is what is used by adegenet package. 

gen 

#now we can explore the file 
dim(gen$tab) #tab means each row is an individual // an object that gets made for format conversion and just genotype matrix 
#11,000 one for each allele 
head(gen$tab[,1:10]) #you have snp matrix and 2 columns (1,2 for each snp) 1 row for each individual 

rownames(gen$tab) #these are the sample names in order// rows are names by individuals and we can pull those out and give us individual names in order 

meta <- read.csv("/Users/rayanhg/Desktop/EVE109-Week9-master/data/metadata.csv")
head(meta) #we care about locality 


### Question 1 
#calculating Fst for males and female separately 


# matching the data of meta to genotype 
match <- meta[match(rownames(gen$tab),meta$Sample_Name),]

head(match)

#subsetting match to sex for Male 
male<-subset(match,match$Sex=="Male") 


#subetting gen which is in genind to male 
subgen <- gen[match$Sex=="Male"]
loci_subgen <- genind2loci(subgen) 
#finding the fst of males using the gen but meta data inside gen b/c same order
fstm <- Fst(loci_subgen,pop = male$Locality)


#following similar steps for female 
fem <- subset(match,match$Sex=="Female")

#subsetting gen which is in genind female 
subgenF<- gen[match$Sex=="Female"] 
loci_subgenF <- genind2loci(subgenF)
#finding the fst of females using the gen but meta data 
fstf <- Fst(loci_subgenF,pop = fem$Locality)  



###Question 2 

#create a 2-panel figure with separate PCAs for males and females

#replacing missing data for males with scalegen 
x <- scaleGen(subgen, NA.method = "mean")  

pca1 <- dudi.pca(x,cent=FALSE,scale=FALSE,scannf=FALSE,nf=3) 

#creating a Male Scatterplot 
male_loc <- as.factor(male$Locality)
s.class(pca1$li,fac=male_loc) 

#repeating same steps for females 

y <- scaleGen(subgenF,NA.method = "mean")

pca2 <- dudi.pca(y,cent=FALSE,scale=FALSE,scannf=FALSE,nf=3)

#creating scatterplot for females  

fem_loc <- as.factor(fem$Locality)
s.class(pca2$li,fac=fem_loc) 

###create a 2 panel view of scatterplot

#creating scatterplot for males 
par(mfrow=c(1,2))
col <- funky(15)
s.class(pca1$li,fac=male_loc,xax= 1,yax=3, col=transp(col,1), axesell=FALSE,
        cstar=0, cpoint=1, grid=FALSE,cellipse = 0,clabel = 0.5)
title("PCA for Males") 


#creating scatterplot for females   
col<- funky(15)
s.class(pca2$li,fac=fem_loc,xax=1,yax=3, col=transp(col,1), axesell=FALSE,
        cstar=0, cpoint=1, grid=FALSE,cellipse = 0,clabel=0.5)  
title("PCA for Females")


