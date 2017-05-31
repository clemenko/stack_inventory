#!/bin.bash
set -eu

for stack_name in $(docker stack ls|grep -v NAME|awk '{print $1}'); do 
 echo "==============" Stack : $stack_name "=============="
 echo ""
  for service in $(docker stack services $stack_name |grep -v REPLICAS|awk '{print $2}' ); do
    echo "==============" Service : $service "=============="
    docker stack services $stack_name |grep $service
    echo "- - - - - - - - - - - "
    docker service ps $service|grep -v NAME|grep -v Shutdown
  done
 echo ""
 done
