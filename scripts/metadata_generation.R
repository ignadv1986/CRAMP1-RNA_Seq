# Get all .csv files
count_files <- list.files(pattern = "\\.csv$")
count_files <- count_files[!grepl("annotation", count_files, ignore.case = TRUE)]

# Combine different samples into a single dataframe:
# Load the first file
combined_counts <- read.csv(count_files[1], row.names = 1)
colnames(combined_counts) <- gsub("\\.csv$", "", count_files[1])  # sample name

# Loop through the rest
for (file in count_files[-1]) {
  temp <- read.csv(file, row.names = 1)
  sample_name <- gsub("\\.csv$", "", file)
  combined_counts[[sample_name]] <- temp[, 1]
}

# Extract sample names from your combined count matrix
sample_names <- colnames(combined_counts)

# Create metadata by parsing sample names
metadata <- data.frame(
  sample = sample_names,
  cell_line = sub("_.*", "", sample_names),
  condition = sub(".*_(WT|KO)_.*", "\\1", sample_names),
  replicate = sub(".*_(\\d+)$", "\\1", sample_names),
  row.names = sample_names
)

