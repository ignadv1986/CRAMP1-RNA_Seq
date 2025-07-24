BiocManager::install("biomaRt")
library(biomaRt)

#Connect to Ensembl

ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

#Define gene symbols from HGNC

h1_genes <- c("H1-0", "H1-1", "H1-2", "H1-4", "H1-10")

#Map your genes to Ensembl ID:
  
  h1_map <- getBM(
    attributes = c("ensembl_gene_id", "external_gene_name"),
    filters = "external_gene_name",
    values = h1_genes,
    mart = ensembl
  )

print(h1_map)

#Transform matrix into rlog
rld_samples_to_analysed <- rlog(dds_samples_to_analysed, blind = TRUE)

# Extract just H1 genes from rlog-transformed matrix
h1_ids <- h1_map$ensembl_gene_id

# Subset the matrix
h1_expr <- assay(samples_to_analysed_hela)[rownames(rld_samples_to_analysed) %in% h1_ids, ]

# Replace row names with readable gene symbols
rownames(h1_expr) <- h1_map$external_gene_name[match(rownames(h1_expr), h1_map$ensembl_gene_id)]

