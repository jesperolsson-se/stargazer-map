<img src="example-plot.svg" title="Fig 1. An example plot showing global spread"/>

```bash
user="jesperolsson-se"

echo "Lat,Lon" > locations.csv
curl -s "https://api.github.com/users/${user}" \
| jq .location \
| xargs -I{} curl -s -G --data-urlencode "q={}" "https://nominatim.openstreetmap.org/search?format=json&limit=1" \
| jq -r '.[] | .lat + "," + .lon' >> locations.csv

Rscript script.R
``` 
