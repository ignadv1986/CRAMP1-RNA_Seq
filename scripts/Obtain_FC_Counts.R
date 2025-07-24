BiocManager::install("Rsubread")
library(Rsubread)

# Automatically list all BAM files
bam_files <- list.files(pattern = "\\.bam$", full.names = TRUE)

# Run featureCounts with paired-end mode enabled
fc_results <- featureCounts(
  files = bam_files,
  annot.ext = gtf_file,
  isGTFAnnotationFile = TRUE,
  GTF.featureType = "exon",
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE,
  isPairedEnd = TRUE,
  nthreads = 4
 )