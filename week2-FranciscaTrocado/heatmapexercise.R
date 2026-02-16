### make a data frame with gene expression values. The gene IDs should be in row names.
df <- data.frame(row.names = c("geneA", "geneB", "geneC", "geneD", "geneE", "geneF", "geneG", "geneH",  "geneI", "geneJ" ),
                 sample1 = runif(10, min = -3, max = 3),
                 sample2 = runif(10, min = -3, max = 3),
                 sample3 = runif(10, min = -3, max = 3),
                 sample4 = runif(10, min = -3, max = 3),
                 sample5 = runif(10, min = -3, max = 3))
### make a simple heatmap
# load library
install.packages("pheatmap")
library(pheatmap)
# make the heatmap
#pheatmap(df)
# re-draw the heatmap without clustering genes
png("heatmap.png", width = 800, height = 600)

pheatmap(df,
         cluster_cols = FALSE,
         border_color = NA)

dev.off()
