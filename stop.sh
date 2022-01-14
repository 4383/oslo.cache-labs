#!/usr/bin/env bash
set -e


declare -a labs_array

for dir in $(find | grep docker-compose-lab);
do
    labs_array+=($(dirname ${dir} | xargs basename))
done

if [ -z $1 ]; then
    echo "Please provide a lab to run!"
    echo -e "Example:\n\t$ ./run.sh labs/memcache_pool_backend"
    echo "List of labs: ${labs_array[@]}"
    exit 1
fi

LAB=labs/$1
if [ ! -f "${LAB}/docker-compose-lab.yml" ]; then
    echo "Wrong lab name ${LAB}... lab not found"
    echo "List of labs: ${labs_array[@]}"
    exit 1
fi

docker-compose -f ${LAB}/docker-compose-lab.yml down
echo "=============================================================="
echo "Your lab is now down"
echo "=============================================================="
