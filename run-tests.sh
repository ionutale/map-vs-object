#!/bin/bash

items=(1000000 2000000 3000000) #4000000 5000000 6000000 7000000 8000000 9000000
        #10000000 20000000 30000000 40000000 50000000 60000000 70000000 80000000 90000000
        #100000000 200000000 300000000 400000000 500000000 600000000 700000000 800000000 900000000
        #1000000000)

rams=(512 1024 2048 4096 8192 16384)
cpus=(0.5 1 2 4)
types=(object array map)

log_text=""

for type in "${types[@]}"
do
  for cpu in "${cpus[@]}"
  do
    for ram in "${rams[@]}"
    do
      for i in "${items[@]}"
      do
          log_text="$type type, $cpu cpu, $ram ram, $i iterations" 
          log_text="$log_text, $(docker run -it --rm \
          -e TYPE=object \
          -e ITERATIONS=$i \
          -m ${ram}m \
          --memory-swap ${ram}m \
          --cpus=${cpu} \
          --name map-vs-object-vs-array-$i \
          map-vs-object-vs-array)"

          echo $log_text
          echo $log_text >> results.txt
      done
    done
  done
done

