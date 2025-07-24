# Define log2 fold change threshold (for FC > 1.5)
log2fc_threshold <- log2(1.5)  # ≈ 0.585

# Filter DEGs based on log2FC and padj
deg_samples_to_be_analysed <- res_samples_to_be_analysed_shrunk[
  which(!is.na(res_samples_to_be_analysed_shrunk$padj) &
          res_samples_to_be_analysed_shrunk$padj < 0.05 &
          abs(res_samples_to_be_analysed_shrunk$log2FoldChange) > log2fc_threshold),
]
