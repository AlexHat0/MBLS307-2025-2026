# first challange - vulcano plot

library(tidyverse)
library (ggplot2)
data<-read.table(file ='/Users/Ake/Desktop/mbls year 2/Omics/MBLS307-2025-2026/week2-al/Sun-etal-2021-IP-MS-PAD4-vs-YFP.txt', header = TRUE, sep='\t')
#calculating -log10 (pval)
data$neglgpval <- -log10(data$pval_PAD4_vs_YFP)

#tresholds
pval_treshold <- 0.05
log2FC_treshold <-1

#check the tresholds
data <- data %>%
  mutate(Significant = if_else(log2_PAD4_vs_YFP > log2FC_treshold & pval_PAD4_vs_YFP < pval_treshold,
                               "YES",
                               "NO"))
str(data)
#'data.frame':	1877 obs. of  15 variables:
  #$ Fasta.headers           : chr  "AT1G01080.1 | Symbols:  | RNA-binding (RRM/RBD/RNP motifs) family protein | chr1:45503-46789 REVERSE LENGTH=293"| __truncated__ "AT1G01090.1 | Symbols: PDH-E1 ALPHA | pyruvate dehydrogenase E1 alpha | chr1:47705-49166 REVERSE LENGTH=428" "AT1G01320.2 | Symbols:  | Tetratricopeptide repeat (TPR)-like superfamily protein | chr1:121582-130099 REVERSE "| __truncated__ "AT1G01610.1 | Symbols: ATGPAT4, GPAT4 | glycerol-3-phosphate acyltransferase 4 | chr1:221950-224255 REVERSE LENGTH=503" ...
  #$ Protein.IDs             : chr  "AT1G01080.1;AT1G01080.2" "AT1G01090.1" "AT1G01320.2;AT1G01320.1" "AT1G01610.1" ...
  #$ Majority.protein.IDs    : chr  "AT1G01080.1;AT1G01080.2" "AT1G01090.1" "AT1G01320.2;AT1G01320.1" "AT1G01610.1" ...
  #$ Norm_abundance_PAD4_rep1: num  22.6 22.4 26.2 24.5 23.1 ...
  #$ Norm_abundance_PAD4_rep2: num  23.2 22.5 26.3 24.2 20.8 ...
  #$ Norm_abundance_PAD4_rep3: num  22.4 22.4 26.3 24.5 23.5 ...
  #$ Norm_abundance_PAD4_rep4: num  23.3 22.3 26.2 23.8 25.2 ...
  #$ Norm_abundance_YFP_rep1 : num  19.4 23 24.9 21 22.3 ...
  #$ Norm_abundance_YFP_rep2 : num  19.1 22.7 25 20.5 19.8 ...
  #$ Norm_abundance_YFP_rep3 : num  20.7 20.1 25.7 19.5 21 ...
  #$ Norm_abundance_YFP_rep4 : num  20.7 23.1 25.5 21.2 20.1 ...
  #$ log2_PAD4_vs_YFP        : num  2.882 0.212 0.971 3.727 2.313 ...
  #$ pval_PAD4_vs_YFP        : num  0.000845 0.77466 0.001873 0.000113 0.074875 ...
  #$ neglgpval               : num  3.073 0.111 2.727 3.945 1.126 ...
  #$ Significant             : chr  "YES" "NO" "NO" "YES" ...

  #violine plot
ggplot(data, aes(x = log2_PAD4_vs_YFP, y = neglgpval)) +
  geom_point(aes(color = Significant), alpha = 0.6) +
  scale_color_manual(values = c("NO" = "blue", "YES" = "red")) +
  geom_vline(xintercept = c(-log2FC_treshold, log2FC_treshold),
             linetype = "dashed") +
  geom_hline(yintercept = -log10(pval_treshold),
             linetype = "dashed") +
  theme_minimal() +
  labs(title = "Volcano Plot: PAD4 vs YFP",
       x = "log2 (PAD4 / YFP)",
       y = "-log10(p-value)")

# challange 2
protein_id <- "AT1G05150.1"
prot <- data %>%
  filter(Majority.protein.IDs == protein_id)

#extracting one replicate
pad4_values <-as.numeric(prot[,c('Norm_abundance_PAD4_rep1',
                                  "Norm_abundance_PAD4_rep2",
                                  "Norm_abundance_PAD4_rep3",
                                  "Norm_abundance_PAD4_rep4")])

yfp_values<- as.numeric(prot[,c('Norm_abundance_YFP_rep1',
                                "Norm_abundance_YFP_rep2",
                                "Norm_abundance_YFP_rep3",
                                "Norm_abundance_YFP_rep4")])
# Create plotting dataframe
plot_df <- data.frame( 
  Abundance = c(pad4_values, yfp_values), 
  Condition = rep(c("PAD4", "YFP"), each = 4) )
str(plot_df)
#'data.frame':	8 obs. of  2 variables:
  #$ Abundance: num  24.5 24.3 24.3 24.4 20.2 ...
  #$ Condition: chr  "PAD4" "PAD4" "PAD4" "PAD4" ...

#extract the parameterss log2_ratio and pvalue
log2_ratio <- round(prot$log2_PAD4_vs_YFP, 2) 
p_value <- signif(prot$pval_PAD4_vs_YFP, 3)

#boxplot
ggplot(plot_df, aes(x = Condition, y= Abundance, fill = Condition)) +
  geom_boxplot() +
  geom_jitter(width = 0.1, size= 2) +
  labs(title = paste('Protein:', protein_id),
       subtitle = paste("log2FC =", log2_ratio, "| p-value =", p_value)) +
  theme()