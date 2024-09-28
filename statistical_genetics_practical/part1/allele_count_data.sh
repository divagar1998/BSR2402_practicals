#! /bin/bash

set -euo pipefail

ml plink
ml R

#genotype data in allele count format

plink --bfile D1D --recode A --out D1D_AC