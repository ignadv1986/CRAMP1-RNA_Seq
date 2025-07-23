# CRAMP1-RNA_Seq

Analysis of RNA-Seq samples derived from U2OS and HeLa cells, both wild-type (WT) and CRAMP1-knockout (KO).

## Background

During a CRISPR/Cas9 screen for factors that sensitize cells to topoisomerase II inhibitors—a class of widely used anticancer drugs—we identified CRAMP1, a previously uncharacterized protein, as a major contributor to drug-induced toxicity.
Further investigation revealed that CRAMP1 localizes to subnuclear structures known as histone locus bodies (HLBs), which serve as key hubs for histone gene transcription. This observation raised the possibility that CRAMP1 plays a role in regulating histone expression. To explore this, we performed RNA-Seq on CRAMP1-knockout and wild-type cells to examine transcriptomic changes, with a particular focus on histone gene regulation.

## Project overview

Here we will cover the workflow used to process RNA-Seq samples generated from the following 4 human cancer cell lines:

- U2OS wild-type (U2OS WT)
- U2OS CRAMP1-knockout (U2OS KO)
- HeLa wild-type (HeLa WT)
- HeLa CRAMP1-knockout (HeLa KO)

The main goal of the project is to investigate a possible role of the CRAMP1 protein in histone expression.
Details on how the samples were generated can be found in the original publication:  
[PMID: 40516529](https://pubmed.ncbi.nlm.nih.gov/40516529/)
The whole processing was performed on R (v4.2.1) using packaged from Bioconductor that are detailes in the tools section, and the final figures were prepared using GaphPad Prism (v10.5.0)

**Note:** Sequencing, quality check and mapping of the initial sequences were carried out by the sequencing platform. Briefly, samples were processed using the nf-core/rna-seq pipeline branch (v.3.10.1), trimmed with Trim Galore! (v.0.6.7) and mapped to the human genome (GRCh38) using STAR (v. 2.6.1b), generating the files in .bam format that are the starting point of this project.

## Tools
- **R** (v4.2.1)

- **Bioconductor packages:**
  
  - **Rsubread:** for read alignment and feature counting  
  - **DESeq2:** for normalization and differential expression analysis  
  - **apeglm:** for log2 fold change shrinkage  
  - **biomaRt:** for gene annotation retrieval  

- **GraphPad Prism:** for figure preparation


