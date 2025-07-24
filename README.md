# CRAMP1-RNA_Seq

Analysis of RNA-Seq samples derived from U2OS wild-type (WT) and CRAMP1-knockout (KO) cells.

## Background

During a CRISPR/Cas9 screen for factors that sensitize cells to topoisomerase II inhibitors—a class of widely used anticancer drugs—we identified CRAMP1, a previously uncharacterized protein, as a major contributor to drug-induced toxicity.
Further investigation revealed that CRAMP1 localizes to subnuclear structures known as histone locus bodies (HLBs), which serve as key hubs for histone gene transcription. This observation raised the possibility that CRAMP1 plays a role in regulating histone expression. To explore this, we performed RNA-Seq on CRAMP1-knockout and wild-type cells to examine transcriptomic changes, with a particular focus on histone gene regulation.

## Project overview

Here we will cover the workflow used to process RNA-Seq samples generated from the following human cancer cell lines:

- U2OS wild-type, from now on referred to as "WT".
- U2OS CRAMP1-knockout (U2OS KO), noted onwards with "KO".

The main goal of the project is to investigate a possible role of the CRAMP1 protein in histone expression.
Details on how the samples were generated can be found in the original publication:  
[PMID: 40516529](https://pubmed.ncbi.nlm.nih.gov/40516529/)
The whole processing was performed on R (v4.2.1) using packaged from Bioconductor that are detailes in the tools section, and the final figures were prepared using GaphPad Prism (v10.5.0)

**Note:** Sequencing, quality check and mapping of the initial sequences were carried out by the sequencing platform. Briefly, samples were processed using the nf-core/rna-seq pipeline branch (v.3.10.1), trimmed with Trim Galore! (v.0.6.7) and mapped to the human genome (GRCh38) using STAR (v. 2.6.1b), generating the files in .bam format that are the starting point of this project.

## Directory structure

CRAMP1-RNA_Seq/
├── data/ # Raw and processed data files
├── scripts/ # R scripts used in analysis
├── results/ # Output tables, plots, heatmaps
├── README.md # Project description

## Tools and softwares
- **R** (v4.2.1)

- **Bioconductor packages:**
  
  - **Rsubread:** for read alignment and feature counting  
  - **DESeq2:** for normalization and differential expression analysis  
  - **apeglm:** for log2 fold change shrinkage  
  - **biomaRt:** for gene annotation retrieval  

- **GraphPad Prism:** for figure preparation

## Workflow

1. **Gene-level count generation:**
   - Feature counts generated from '.bam' files using `Rsubread::featureCounts` with GENCODE v41 GTF annotation (GRCh38 reference genome).
   - Paired-end reads and exon-level counting were specified.
2. **Metadata generation:**
   - Organization of sample data into a matrix for downstream gene expression analysis.
   - Count matrices from different matrices were merged.
3. **Differential gene expression analysis:**
   - Performed with DESeq2.
   - WT vs KO cells of each cell line were compared. 
4. **Shrinkage of log2 fold changes:**
   - apeglm was used to shrink log2 fold changes for improved accuracy and visualization.
5. **Definition of differentially-expressed genes (DEGs):**
    - The threshold for DEGs was set at log2 fold change > 1.5 and an adjusted p-value for false discovery rate lower than 0.05.
6. **Gene annotation:**
    - Gene symbols were retrieved using the biomaRt package, querying Ensembl (Ensembl v106).
7. **Visualization:**
    - Files showing histone expression were exported and plotted with GraphPad Prism.

## Conclusions

- RNA-Seq profiles from WT and KO cells show profound differences.
- Despite localizing to HLBs, CRAMP1 controls the expression of only the linker histone H1, but its knock-out has no effect on core histone levels.
- CRAMP1 controls the expression of most H1 isoforms, even the replication-independent H1.0 and H1.X, which are transcribed outside of HLBs.
