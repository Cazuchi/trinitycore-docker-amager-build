#!/bin/bash
set -e

CLIENT_DIR="/wow-client"
OUTPUT_DIR="/server/data"

if [ ! -d "$CLIENT_DIR/Data" ]; then
  echo "Error: Could not find 'Data' folder at $CLIENT_DIR/Data. Make sure your volume mount points to the root WoW directory!"
  exit 1
fi

# Switch working directory to the writable output folder
cd "$OUTPUT_DIR"

echo "=== 1/4 Extracting DBC and Maps ==="
/server/bin/mapextractor -i "$CLIENT_DIR"

echo "=== 2/4 Extracting VMaps ==="
/server/bin/vmap4extractor -d "$CLIENT_DIR"
mkdir -p "$OUTPUT_DIR/vmaps"
/server/bin/vmap4assembler Buildings "$OUTPUT_DIR/vmaps"
rm -rf Buildings

echo "=== 3/4 Generating MMaps (NavMesh) ==="
mkdir -p "$OUTPUT_DIR/mmaps"
/server/bin/mmaps_generator

echo "=== Extraction Complete! ==="