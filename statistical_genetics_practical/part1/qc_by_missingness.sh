#! /bin/bash

set -euo pipefail

ml plink
ml R

#apply QC by individual missingness
#generate new binary files and remove individuals with missingness greater than 3%
plink --bfile D1D --mind 0.03 --out D1D_imiss3pc --make-bed

#apply QC by SNP missingness and minor allele frequecy
#create new binary file following previous by setting MAF threshold to 5% 
#and SNP missingness to 2%
plink --bfile D1D_imiss3pc --geno 0.02 --maf 0.05 --out D1D_imiss3pc_lmiss2pc_maf5pc --make-bed

#check if distribution of missing SNPs is skewed to either case or control
plink --bfile D1D --test-missing --out D1D_test_missing

#apply QC by HWE
#apply HWE threshold of 0.0001
plink --bfile D1D_imiss3pc_lmiss2pc_maf5pc --hwe 0.0001 --out D1D_QC --make-bed

#apply all QC steps in single command
plink --bfile D1D --mind 0.03 --hwe 0.0001 --geno 0.02 --maf 0.05 --out D1D_QC_2 --make-bed