#! /bin/bash

set -euo pipefail

ml plink
ml R

#perform GWAS using logistic regression on case and control
plink --bfile D1D_QC --logistic --out D1D.loststic --pheno D1D.pheno1 --ci 0.95

#perform GWAS using logistic regression on case and control with dominant mode of inheritance
plink --bfile D1D_QC --logistic dominant --out D1D.dominant --pheno D1D.pheno1 --ci 0.95

#perform GWAS using logistic regression on case and control with recessive mode of inheritance
plink --bfile D1D_QC --logistic recessive --out D1D.recessive --pheno D1D.pheno1 --ci 0.95

#include covariates
plink --bfile D1D_QC --logistic hide-covar --out D1D.loststic.covar --pheno D1D.pheno1 --ci 0.95 --covar D1D.pcs1234