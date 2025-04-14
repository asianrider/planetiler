#!/bin/sh

print_help() {
  echo "run.sh {area} {ram/mmap}"
  exit 1
}

(( $# )) || print_help

java -Xmx30g \
  -jar planetiler.jar \
  `# Download the latest planet.osm.pbf from s3://osm-pds bucket` \
  --area=$1 --bounds=planet --download --force \
  `# Accelerate the download by fetching the 10 1GB chunks at a time in parallel` \
  --download-threads=10 --download-chunk-size-mb=1000 \
  `# Also download name translations from wikidata` \
  --fetch-wikidata \
  --mbtiles=output.mbtiles \
  `# Store temporary node locations at fixed positions in a memory-mapped file` \
  --nodemap-type=array --storage=$2


