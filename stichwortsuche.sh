
#!/bin/bash

# ======================
# stichwortsuche.sh
# ======================
#
# A utility script to find files modified after a certain date,
# containing a given keyword, and export them as a CSV.
#
# Usage:
#   ./stichwortsuche.sh YYYY-MM-DD keyword [output_file]
#
# Example:
#   ./stichwortsuche.sh 2025-06-01 prompt matching_files.csv
#

# ----------------------
# Parse Arguments
# ----------------------
START_DATE="$1"
KEYWORD="$2"
OUTPUT_FILE="${3:-matched_files.csv}"  # Default: matched_files.csv

if [[ -z "$START_DATE" || -z "$KEYWORD" ]]; then
  echo "Usage: $0 <start-date YYYY-MM-DD> <keyword> [output_file]"
  exit 1
fi

# ----------------------
# Perform Search
# ----------------------
echo "Searching for files modified after $START_DATE containing keyword '$KEYWORD'..."

find . \
  -newermt "$START_DATE" \
  -not -path '*filelist*' \
  -type f \( -name "*.txt" -o -name "*.md" -o -name "*.html" \) \
  -print0 |
xargs -0 grep -ilZ "$KEYWORD" |
xargs -0 -I{} stat -c '%n,%y' {} |
sed 's/\.[0-9]\+ \+0[12]00//' |
sort > "$OUTPUT_FILE"

echo "Done. Results saved to: $OUTPUT_FILE"


