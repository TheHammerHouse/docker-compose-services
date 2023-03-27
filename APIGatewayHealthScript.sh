#!/bin/bash

# Wait for port 5432 on host AuthServer to be open
while ! nc -z catalogueserver 5002; do
echo "Cannot connect to the catalogue server, sleeping for 0.1s"
  sleep 0.1
done


while ! nc -z grpcServer 5003; do
echo "Cannot connect to the auction server, sleeping for 0.1s"
  sleep 0.1
done

# Start the api-gateway-server service (replace this with the correct command for starting your service)
echo "Executing the APIGatewayServer"
exec java -jar APIGatewayServer-0.0.1-SNAPSHOT.jar