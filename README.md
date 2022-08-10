# Molecular-Evolution-HW
projects and homework problems done in R  

- input folder contains the files necessary for solving the homework problems 

- the output folder contains the plots that were created 

## Homework 3: Write a script that does the following:
1. Read in "genotypes.csv" and subset the dataframe to Mt Buller samples only. How many samples do you have from each year?
2. Calculate mean observed heterozygosity for each year. Put these into a single dataframe along with a column indicating the year.
3. Calculate mean expected heterozygosity for each year. Add these to the dataframe from question 2.
4. Plot mean expected heterozygosity over time.
5. Add a vertical lines to your plot to show when introductions took place (hint - use the abline command)

## Homework 4: Write a script that does the following:
 
1. Read in the metadata file. Print a table showing how many individuals we have from each population.
2. Run the clustering analysis using the snmf command. Create a cross-entropy plot.
3. Get a Q matrix for K=5 (used in the paper). Add sample IDs from the metadata file as rownames to the Q matrix. Print the head of the Q matrix.
4. For the “TAS” population, what are the average ancestry proportions from each cluster?
5. Plot the ancestry barplot with populations labelled at the bottom. Color palette is up to you :) 

## Homework 6: Write a script that does the following:
1. Read in the "genotypes.csv" and "metadata.csv". Reorder the metadata so that samples in the same order as in the genotypes file.
2. Write a function that returns the proportion of data for each individual that is missing. Apply the function to your genotype data and print the summary.
3. Create a PCA. Color by Field.ID and add a legend.

## Homework 7: Write a script that does the following:
1. Finish filling out the spreadsheet with results from BOLD and BLAST. Read the data file into R and print the dataframe.
2. Make a barplot showing the number of samples labelled correctly vs. incorrectly according to BOLD.
3. Make a barplot showing the number of each species we found based on BOLD. 

## Homework 8: Write a script that does the following:
1. Load in the genotype data (snp_data.csv) and the phenotype data (bill_data.csv). Notice that these data are not in the same order.
2. Perform and plot the GWAS for bill length. This may take a while. Add a dashed line representing a p-value cutoff of p<0.05
3. Using the GWAS output, make a barplot showing how many significant (p<0.05) SNPs are on each chromosome (this will require application several skills we've learned previously) 

## Homework 8: Write a script that does the following:
1. Calculate Fst for males and females separately
2. Create a 2-panel figure with separate PCAs for males and females.
