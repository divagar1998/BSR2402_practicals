#! /bin/bash

set -euo pipefail

ml plink 
ml R

#prune out the data that are in linkage disequilibrium to trim the SNP dataset
plink --bfile D1D_QC --indep-pairwise 1500 150 0.2 --out D1D_QC_pruning
plink --bfile D1D_QC --extract D1D_QC_pruning.prune.in --make-bed --out D1D_QC_thin
plink --bfile D1D_QC_thin --genome --out D1D.genome