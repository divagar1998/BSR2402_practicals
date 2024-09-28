#! /bin/bash

set -euo pipefail

ml plink
ml R

#create binary format PLINK files

plink --file D1D --make-bed --out D1D