#!/bin/bash

export FABRIC_START_WAIT=5

echo -e '-----------------------\e[5;32;40m Install chaincodes\e[m---------------------------------------------------------'

echo " ----------------------------- For channel1 channel --------------------------------------------"
docker exec cli.Manufacturer bash -c 'peer chaincode install -p auto -n channel1chaincode -v 0'
docker exec cli.Supplier1 bash -c 'peer chaincode install -p auto -n channel1chaincode -v 0'
docker exec cli.Supplier1A bash -c 'peer chaincode install -p auto -n channel1chaincode -v 0'
docker exec cli.Agency bash -c 'peer chaincode install -p auto -n channel1chaincode -v 0'
sleep ${FABRIC_START_WAIT}


echo "----------------------------- For channel2 channel------------------------------------------------"
docker exec cli.Manufacturer bash -c 'peer chaincode install -p auto -n channel2chaincode -v 0'
docker exec cli.Supplier1 bash -c 'peer chaincode install -p auto -n channel2chaincode -v 0'
docker exec cli.Supplier1B bash -c 'peer chaincode install -p auto -n channel2chaincode -v 0'
docker exec cli.Agency bash -c 'peer chaincode install -p auto -n channel2chaincode -v 0'
sleep ${FABRIC_START_WAIT}


echo " ----------------- For channel3 channel ----------------------------------------------------"
docker exec cli.Manufacturer bash -c 'peer chaincode install -p auto -n channel3chaincode -v 0'
docker exec cli.Supplier2 bash -c 'peer chaincode install -p auto -n channel3chaincode -v 0'
docker exec cli.Supplier2A bash -c 'peer chaincode install -p auto -n channel3chaincode -v 0'
docker exec cli.Agency bash -c 'peer chaincode install -p auto -n channel3chaincode -v 0'
sleep ${FABRIC_START_WAIT}
