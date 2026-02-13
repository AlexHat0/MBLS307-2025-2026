# Omics in the Life Sciences
# Week 2
# Intermediate trajectory
# 2026-02-13
# Bernadeta Savicka


# Heatmap exercise

library(pheatmap)

df <- data.frame(row.names = paste0("gene",1:10),
                  sample1 = runif(10, min = -3, max = 3),
                  sample2 = runif(10, min = -3, max = 3),
                  sample3 = runif(10, min = -3, max = 3),
                  sample4 = runif(10, min = -3, max = 3),
                  sample5 = runif(10, min = -3, max = 3))


pheatmap(df2, border_color = NA, filename = "output/heatmap.png")