BiocManager::install("apeglm")
library(apeglm)

res_samples_to_be_analysed_shrunk <- lfcShrink(
  dds = samples_to_be_analysed,
  coef = "condition_condition1_vs_condition2",
  type = "apeglm"
)
