<img src="example-plot.svg" title="Fig 1. An example plot showing global spread"/>

```bash
organization="schemaspy"
repository="schemaspy"
pages=1

echo "Lat,Lon" > locations.csv

for i in $(seq 1 $pages); do
  curl -s "https://api.github.com/repos/${organization}/${repository}/stargazers?per_page=5&page=$i" \
    -H 'Accept: application/vnd.github.v3.star+json' \
  | jq .[].user.url \
  | xargs curl -s \
  | jq .location \
  | xargs -I{} sh -c '{ ./locationToCoordinates.sh {} >> locations.csv; sleep 2; }'
done

Rscript script.R
``` 
