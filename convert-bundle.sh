#!/bin/bash
set -euo pipefail

curl -o lab3-bundle.tar.gz https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz

INPUT_TSV=$(find . -maxdepth 2 -name "*.tsv" | head -n 1)

awk '!/^[[:space:]]*$/' "$INPUT_TSV" > cleaned.tsv

sed 's/\t/,/g' cleaned.tsv > cleaned.csv

TOTAL_LINES=$(wc -l < cleaned.csv)
DATA_ROWS=$((TOTAL_LINES - 1))
echo "The cleaned CSV file contains $DATA_ROWS data row(s)."

tar -czf converted-archive.tar.gz cleaned.csv