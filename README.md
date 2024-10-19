```bash
user="jesperolsson-se"

curl -s "https://api.github.com/users/${user}" | jq .location
``` 
