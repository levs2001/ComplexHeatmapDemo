setwd("/Users/lev.saskov/MyProgramms/Univercity/LessonsR")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ComplexHeatmap")

library(ComplexHeatmap)

# Making the dataset

mat <- matrix(rnorm(18 * 24), nrow = 18, ncol = 24)

#Something more specific
set.seed(123)
nr1 <- 4; nr2 <- 8; nr3 <- 6; nr <- nr1 + nr2 + nr3
nc1 <- 6; nc2 <- 8; nc3 <- 10; nc <- nc1 + nc2 + nc3
mat <- cbind(rbind(matrix(rnorm(nr1 * nc1, mean = 1, sd = 0.5), nr = nr1),
                   matrix(rnorm(nr2 * nc1, mean = 0, sd = 0.5), nr = nr2),
                   matrix(rnorm(nr3 * nc1, mean = 0, sd = 0.5), nr = nr3)),
             rbind(matrix(rnorm(nr1 * nc2, mean = 0, sd = 0.5), nr = nr1),
                   matrix(rnorm(nr2 * nc2, mean = 1, sd = 0.5), nr = nr2),
                   matrix(rnorm(nr3 * nc2, mean = 0, sd = 0.5), nr = nr3)),
             rbind(matrix(rnorm(nr1 * nc3, mean = 0.5, sd = 0.5), nr = nr1),
                   matrix(rnorm(nr2 * nc3, mean = 0.5, sd = 0.5), nr = nr2),
                   matrix(rnorm(nr3 * nc3, mean = 1, sd = 0.5), nr = nr3))
)
mat <- mat[sample(nr, nr), sample(nc, nc)] # random shuffle rows and
rownames(mat) <- paste0("row", seq_len(nr))
colnames(mat) <- paste0("column", seq_len(nc))


# Посмотрим на объект heatmap
heatmap1 <- Heatmap(mat)
isS4(heatmap1)
isS4(heatmap1@row_dend_param)
heatmap1@row_dend_param$cluster

heatmap2 <- Heatmap(mat)

heatmapList <- heatmap1 + heatmap2
draw(heatmapList)