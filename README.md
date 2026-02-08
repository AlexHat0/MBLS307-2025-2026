# MBLS307 Omics for the Life Sciences 2025-2026


# Git - how to README
Install Git, not GitHub Desktop

Useful links:
- Configure GitHub for Rstudio

https://gist.github.com/Z3tt/3dab3535007acf108391649766409421

- Installing Git

https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

- How to resolve a merge conflict

https://www.youtube.com/watch?v=C_6LiLfyAh8

  
# Assignment 1 README
This repository contains code for the GWAS assignment in the course Omics for the Life Sciences 2025-2026. It is based on the publication Dijkhuizen et al., 2024:
- https://doi.org/10.1111/tpj.70405
- https://github.com/SnoekLab/Dijkhuizen_etal_2025_Drone/tree/main

SNP can be found in the publication-associated repository
https://public.yoda.uu.nl/science/UU01/S5FCM9.html

Phenotypic data used in the GWAS analysis come from the preprint by Bañales et al., 2025 (https://doi.org/10.1101/2025.11.10.687460)

Gene annotation data for the V8 version of the lettuce genome (cv. Salinas):
https://data.4tu.nl/datasets/af1b751d-23a2-4954-ac01-4eb6c68d895b/1
File: Lactuca_sativa_Salinas_V8.annotation_overview.tsv

## Instructions
1. Download the script from this repository - "GWAS-Omics-2025-26.r" (for the GWAS analysis) and "filtering_GWAS_results.r" (for initial exploration of the GWAS results)
2. Put the scripts into your working directory, open the GWAS script in RStudio 
3. Create folder "GWAS_objects" in the working directory and download there the SNP matrix file 'obj_all.ALTREF_SNP_matrix_sat_2024_R4.3.2.out' from the repository https://science.public.data.uu.nl/vault-lettuceknow-publications/Dijkhuizen_etal_2025%5B1740041109%5D/original/GWAS_objects/
4. Create folder "GWAS_sat" in the working directory - results of the GWAS will be saved there
5. Create folder "GWAS_input" in the working directory - the phenotype input file should be saved here. Please use the provided template Excel file which can be found under the assignment description in Brightspace ("GWAS-trait-input-example_v2.tsv")
6. Check sections in the script; if unclear ask the instructor for explanations.
7. Run the GWAS script. You need to install the libraries first. Ask the instructor for help if you run into difficulties.
8. Explore the Manhatthan plot saved in the folder "GWAS_sat/plots/"
9. Create folder "gene_annotation" in the working directory - results of the gene annotation for the QTL will be saved there.
10. Run the script "filtering_GWAS_results.r".
11. Open the tab-separated file saved in "gene_annotation", check the protein domain descriptions (e.g., do they have terms related to disease resistance, receptor-like kinases, leucine-rich repeat domains?)
