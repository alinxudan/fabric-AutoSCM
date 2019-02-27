#!/bin/bash

export FABRIC_START_WAIT=5

echo -e "-------------------------\e[5;32;40mNow Creating channels\e[m -----------------------------"
docker exec cli.Manufacturer bash -c 'peer channel create -c channel1 -f ./channels/channel1.tx -o orderer.example.com:7050'
sleep ${FABRIC_START_WAIT}
docker exec cli.Manufacturer bash -c 'peer channel join -b channel1.block'
sleep ${FABRIC_START_WAIT}

docker exec  cli.Supplier1 bash -c 'peer channel create -c channel2 -f ./channels/channel2.tx -o orderer.example.com:7050'
sleep ${FABRIC_START_WAIT}
docker exec  cli.Supplier1 bash -c 'peer channel join -b channel2.block'
sleep ${FABRIC_START_WAIT}

docker exec  cli.Supplier2 bash -c 'peer channel create -c channel3 -f ./channels/channel3.tx -o orderer.example.com:7050'
sleep ${FABRIC_START_WAIT}
docker exec  cli.Supplier2 bash -c 'peer channel join -b channel3.block'

sleep ${FABRIC_START_WAIT}
echo -e "-------------------------\e[5;32;40mNow Joining channels\e[m -----------------------------"
#Manufacturer joins all channels, but we already joined channel1,  so join the other two
docker exec cli.Manufacturer bash -c 'peer channel join -b channel2.block'
sleep ${FABRIC_START_WAIT}
docker exec cli.Manufacturer bash -c 'peer channel join -b channel3.block'
sleep ${FABRIC_START_WAIT}

#Supplier1  joins 2 channels, but we already joined channel2 when we created it,  so join the other 
docker exec cli.Supplier1 bash -c 'peer channel join -b channel1.block'
sleep ${FABRIC_START_WAIT}


#Agency  joins 3 channels
docker exec cli.Agency bash -c 'peer channel join -b channel1.block'
sleep ${FABRIC_START_WAIT}
docker exec cli.Agency bash -c 'peer channel join -b channel2.block'
sleep ${FABRIC_START_WAIT}
docker exec cli.Agency bash -c 'peer channel join -b channel3.block'
sleep ${FABRIC_START_WAIT}


#Supplier1A  joins 1 channel
docker exec cli.Supplier1A bash -c 'peer channel join -b channel1.block'
sleep ${FABRIC_START_WAIT}


#Supplier1B  joins 1 channel
docker exec cli.Supplier1B bash -c 'peer channel join -b channel2.block'
sleep ${FABRIC_START_WAIT}

#Supplier2A joins 1 channel,
docker exec cli.Supplier2A bash -c 'peer channel join -b channel3.block'
sleep ${FABRIC_START_WAIT}


echo -e ".. \e[5;32;40mlet us use the anchor peer update transactions:\e[m"

docker exec cli.Manufacturer bash -c 'peer channel update -o orderer.example.com:7050 -c channel1 -f ./channels/channel1anchor.tx'
sleep ${FABRIC_START_WAIT}
docker exec cli.Supplier1 bash -c 'peer channel update -o orderer.example.com:7050 -c channel2 -f ./channels/channel2anchor.tx'
sleep ${FABRIC_START_WAIT}
docker exec cli.Supplier2 bash -c 'peer channel update -o orderer.example.com:7050 -c channel3 -f ./channels/channel3anchor.tx'
