#!/bin/bash
cd data
[ -f output.mbtiles ] && mv output.mbtiles tiles.mbtiles
docker run --rm -it -v $(pwd):/data -p 8001:80 maptiler/tileserver-gl

