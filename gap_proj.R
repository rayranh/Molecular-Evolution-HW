library(ape) 
library(msa)
#read fasta file 
data <- readDNAStringSet("/Users/rayanhg/Desktop/R_Projects/gap_project.fasta", format = "fasta")

#making dnastring set in order to do MSA
dna_ss <- DNAStringSet(data)

#running MSA package on dna string set  
alignment <- msa(dna_ss) 
 
library(seqinr)

#converting alignment to seqinr? 
alignment <- msaConvert(alignment, "seqinr::alignment")  

#clustering based off similiarity 
dist_matrix <- dist.alignment(alignment, "similarity") 

#make a plot based off similarity and clustering 
clustering <- hclust(dist_matrix) 
plot(clustering,hang = -1) 

phylotree <- as.phylo(clustering)   
#this turns the phylogenetic tree sideways  
plot(phylotree) 
#this creates a radial phylogenetic tree 
plot(phylotree, type= "cladogram")
