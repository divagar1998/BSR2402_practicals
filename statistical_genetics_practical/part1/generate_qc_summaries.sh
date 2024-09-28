#! /bin/bash

set -euo pipefail

ml plink
ml R

#generate files containing missingness information
plink --bfile D1D --missing --out D1D_missing

#generate hardy weinberg equilibrium statistics
plink --bfile D1D --hardy --out D1D_hardy

#generate allele frequencies
plink --bfile D1D --freq --out D1D_freq