#!/bin/bash

curl -s -G --data-urlencode "q=$1" "https://nominatim.openstreetmap.org/search?format=json&limit=1" \
| jq -r '.[] | .lat + "," + .lon'
