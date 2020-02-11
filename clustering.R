
#kmeans
library(factoextra)

clustering_results <- kmeans(USArrests, 4) 
clustering_results$centers
clustering_results$size 

#import data
setwd('C:/Users/dell/Desktop/iti/ITI_DATAMINING')
seeds <- read.csv('seeds_dataset.txt', sep = '\t')
nrow(seeds)
head(seeds)

#add column header
feature_name <- c('Area', 'Perimeter', 'Compactness', 'Kernel_Length', 'Kernel_Width', 'Assymetry_Coef', 'Kernel_Groove_Length', 'Type_of_Seed')
colnames(seeds) <- feature_name
print(seeds$Kernel_Length)

#Any NA data?
any(is.na(seeds))
seeds <- na.omit(seeds) #drops any row with NA

seed_label <- seeds$Type_of_Seed
seeds$Type_of_Seed <- NULL 

scaled_data <- scale(seeds)

#euclidean distance
dist_mat <- dist(scaled_data, method = "euclidean")
head(dist_mat)

#hierarchial clustering
hclust_avg <- hclust(dist_mat, method = "average")
plot(hclust_avg)

#apply kmeans on seeds
seeds_kmeans <- kmeans(seeds, 3)
