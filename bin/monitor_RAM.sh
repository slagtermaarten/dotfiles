#!/bin/zsh

minimum_RAM=${1:-1000000}

echo "Will notify if available memory becomes smaller than $( expr $minimum_RAM / 1000000 )GB"

monitor_ram() {
  ## At least 1GB of RAM available
  while (( $(free | awk 'NR == 2 { print $7 }') > $minimum_RAM )) {
    sleep 2
  }
  echo "RAM usage too high" | mail -s "Coley RAM usage" -t $EMAIL
}

monitor_ram
