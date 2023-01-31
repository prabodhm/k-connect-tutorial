#~/bin/bash

i=0
while trye
do
  curl -s https://api.weather.gov/alerts\?limit\=500 | jq '.features' | jq -c '.[]' | kafka-console-producer --bootstrap-server localhost:9092 --topic weather-alerts
  ((i=i+1))
  if [[ $((i % 10)) == 0 ]]; then
    echo "Produced 5000 messages.sleeping for 5 seconds"
    sleep 5
  fi
donw  
