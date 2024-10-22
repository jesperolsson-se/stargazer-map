```bash
user="jesperolsson-se"

curl -s "https://api.github.com/users/${user}" \
| jq .location \
| xargs -I{} curl -s -G --data-urlencode "q={}" "https://nominatim.openstreetmap.org/search?format=json&limit=1" \
| jq -r '.[] | .lat + "," + .lon'
``` 
