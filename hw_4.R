# Rayanh Gutierrez
# 10/20/2019
# Week 4
# EVE 109


# Answer to question 1
# Loading libraries for LEA = analyze data
library(LEA)
# read metadata file print a table showing how many individuals

data <- read.csv("/Users/rayanhg/Desktop/Week_4/price_pops.csv")

table <- table(data)

print(table)

# Answer to Question 2
# run clustering analysis using smf
# assign project and use LEA to read file / look at data  structure
project <- snmf("/Users/rayanhg/Desktop/Week_4/price_genos.geno",
                K = 1:5,
                entropy = TRUE,
                repetitions = 10,
                project = "new"
)


# create a cross-entropy plot
plot(project, col = "blue", pch = 19)

# Answer to Question 3
# get a Q matrix for the "best" K value

qmatrix <- Q(project, K = 5, run = 1)

# add sample IDs from the metadata file as rownames to the Q matrix
# using data$sample_id to assign id's to data in qmatrix

rownames(qmatrix) <- data$sample.id

print(head(qmatrix))

# Answer to question 4
# finding avg ancestry proportions
# Separating TASfrom rest of population
x <- qmatrix[data$pop == "TAS", ]

# average ancestry proportions from each cluster found using apply function

A <- apply(x[, 1:5], MARGIN = 2, mean)

print(A)

# plot ancestry barplot with populations labelled on bottom
# install.packages("devtools")

devtools::install_github("johannesbjork/LaCroixColoR")
library(LaCroixColoR)
my.cols <- lacroix_palette("Pamplemousse", n = 5, type = "discrete")
bp <- barchart(project, 5, run = 1, border = NA, space = 0, col = my.cols)
bp <- axis(1, at = 1:length(bp$order), labels = data$population, las = 2, cex.axis = 0.4)
