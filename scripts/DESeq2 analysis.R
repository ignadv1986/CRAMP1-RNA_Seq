BiocManager::install("DESeq2")
library(DESeq2)

# Create a dataset with the different samples to be analysed (if needed)
# Example (select only the U2OS samples)

u2os_samples <- metadata$cell_line == "U2OS"
dds_u2os <- DESeqDataSetFromMatrix(
  countData = combined_counts[, u2os_samples],
  colData = metadata[u2os_samples, ],
  design = ~ condition
)

# Run dataset through DESeq2

dds_samples_to_be_analysed <- DESeq(samples_to_be_analysed)

#Compare the different conditions

res_samples <- results(dds_samples_to_be_analysed, contrast = c("condition", "condition_1", "condition_2"))