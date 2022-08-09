#Rayanh Gutierrez
#10/14/19
#EVE 109
#Week 3 

#Answer to Question 1 

#reading genotype data
data <- read.csv("/Users/rayanhg/Desktop/Projects_R/EVE109-Week3/data/genotypes.csv") 

#activating adegenet package 
library(adegenet)

#separating MtBuller data from other data 
MtBuller<-subset(data,Pop=="MtBuller")

#separating all the data that does not include genotypes 

alleles <- MtBuller[,4:ncol(data)]

#calculate observed heterozygosity for MtBuller
genind <- df2genind(alleles,sep="/",
                    NA.char="NA/NA", pop = MtBuller$Pop)
genind <- seppop(genind)

#looking at genind results 
summary(genind) 

#assigning summary of genind as a result object 
Mt.Bull <- summary(genind$MtBuller)  
#showing observed heterozygosity at mtbuller
Mt.Bull$Hobs 

#observations per year
samples<-table(MtBuller$Year)

#printing number of samples per year 
print(samples) 

#Answer to Question 2 

#separating populations based on years using seppop function
genindPop <- df2genind(alleles,sep="/",
                       NA.char="NA/NA",
                       pop=MtBuller$Year) 

genindPop <- seppop(genindPop) 

#printing the list of genind populations
print(genindPop) 

#obtaining observed heterozygosity for each year in MtBuller sample 
A <- summary(genindPop$`2010`) 
B <- summary (genindPop$`2011`)
C<- summary(genindPop$`2012`)
D<- summary(genindPop$`2013`)
E<- summary(genindPop$`2014`)
G<- summary(genindPop$`2015`) 


#assigning the years as data column 
year <- c(2010,2011,2012,
          2013,2014,2015) 

#assigning the mean of heterozygosity observed to columns
obsv <- c(A$Hobs,B$Hobs,C$Hobs,
          D$Hobs,E$Hobs,G$Hobs) 

#creating a data frame based off year and observation
df <- data.frame( year, obsv) 
#first data frame 
print(df) 

#Answer to Question 3  

#assigning the mean of heterozygosity expected to columns
ex <- c(A$Hexp,B$Hexp,C$Hexp,D$Hexp,
        E$Hexp,G$Hexp)  


#adding the expected heterozygosity values to the data frame 
df2 <- data.frame(year,obsv,ex) 

#printing second data frame
print(df2) 

head(df2) 


#Answer to Question 4  

library(ggplot2)

#plotting the expected mean heterozygosity value based on year

ggp <- ggplot(df2, aes(x= year , y = ex )) +
  geom_col(aes(fill= year )) +  
  theme(legend.position = "none") + 
  geom_bar(stat = "identity" , fill = "lightblue") + 
  ylab("expected heterozygosity")
  
 

#Answer to Question 5 

#showing when introductions took place in 2012 
ggp + 
  geom_vline(xintercept = 2012, color = "red")

