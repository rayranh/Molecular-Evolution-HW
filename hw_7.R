#Rayanh Gutierrez
#EVE 109 
#11/11/2019
#Week 7


### Question 1  


#read file and Print data frame  
library(readxl) 
excel <- read_xlsx("/Users/rayanhg/Desktop/R_data/wk7_data.xlsx") 
#making excel a dataframe 
data <- data.frame(excel) 
#printing dataframe
print(data)


#need to make table in order to make barplot 
table <- table(data$BOLD.mislabelled)
table
### Question 2 

#make a barplot correct vs incorrect (No, Yes) 
barplot(table, ylab = "No. of Samples", xlab = "Mislabelled",main="Number of Mislabels")

### Question 3 
#the number of species we found based on bold 

species<- table(data$BOLD.species)
barplot(species, ylab= "No of samples", xlab= "Species",cex.names = 0.7) 


