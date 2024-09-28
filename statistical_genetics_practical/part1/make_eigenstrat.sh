#! /bin/bash

set -euo pipefail

ml plink
ml R

plink --bfile D1D_QC_thin --pca --out D1D.pca

