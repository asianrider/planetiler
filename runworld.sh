#!/usr/bin/env bash
set -e
java -Xmx100g -Xms100g \
  -XX:OnOutOfMemoryError="kill -9 %p" \
  -jar planetiler.jar \
  `# Download the latest planet.osm.pbf from s3://osm-pds bucket` \
  --area=planet --bounds=world --download \
  `# Accelerate the download by fetching the 10 1GB chunks at a time in parallel` \
  --download-threads=10 --download-chunk-size-mb=1000 \
  `# Also download name translations from wikidata` \
  --fetch-wikidata \
  --mbtiles=output.mbtiles \
  --nodemap-type=sparsearray --nodemap-storage=ram 2>&1 | tee logs.txt

