#!/bin/bash

items=(
  1 2 3 4 5 6 7 8 9
  10 20 30 40 50 60 70 80 90
  100 200 300 400 500 600 700 800 900
  1000 2000 3000 4000 5000 6000 7000 8000 9000
  10000 20000 30000 40000 50000 60000 70000 80000 90000
  100000 200000 300000 400000 500000 600000 700000 800000 900000
  1000000 2000000 3000000 4000000 5000000 6000000 7000000 8000000 9000000
  10000000 20000000 30000000 40000000 50000000 60000000 70000000 80000000 90000000
  100000000 200000000 300000000 400000000 500000000 600000000 700000000 800000000 900000000
  1000000000)

rams=(128 256 512 1024 2048 4096 8192 16384)
cpus=('0.5' '1.0' '2.0' '3.0' '4.0')
types=("object" "array_" "map___")

log_text=""


for i in "${items[@]}"
do
  for ram in "${rams[@]}"
  do
    for cpu in "${cpus[@]}"
    do
      for type in "${types[@]}"
      do
          log_text="$cpu cpu, $ram ram, $i iterations, $type type" 
          log_text="$log_text, $(docker run -it --rm \
          -e TYPE=$(echo $type | tr -d '_') \
          -e ITERATIONS=$i \
          -m ${ram}m \
          --memory-swap ${ram}m \
          --cpus=${cpu} \
          --name map-vs-object-vs-array-$i \
          map-vs-object-vs-array)"

          echo $log_text | column -t
          echo $log_text >> results.txt
      done
    done
  done
done

