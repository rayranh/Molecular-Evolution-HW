#Rayanh Gutierrez 
#EVE 109 
#11/16/2019
#Week 8 

### Question 1 
install.packages("rrBLUP")

library(rrBLUP)

#load and read geno/pheno data 

geno <- read.csv("/Users/rayanhg/Desktop/EVE109-Week8-master/data/snp_data.csv", row.names = 1)

pheno <- read.csv("/Users/rayanhg/Desktop/EVE109-Week8-master/data/example_pheno.csv", row.names = 1)

### Question 2 

#perform and plot GWAS for bill length 
g <- GWAS(pheno,geno,min.MAF=0.05,plot=TRUE)

#adding a dashed line to show p<0.05
abline(h=-log(0.05),col="red",lty="dashed")

###Question 3 

#using the GWAS output, make a barplot showing significant (p<0.05) 

sub <- subset(g,BillLength>-log(0.05))

table <- table(sub$chr)

barplot(table, xlab = "chromosome", ylab = "# of significant snps")
