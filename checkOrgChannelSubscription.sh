#!/bin/bash

export FABRIC_START_WAIT=5
echo -e '******\e[5;32;40mList of orgs and their subscriptions to channel1 channel2 and channel3 blockchain\e[m************************************'

echo -e '******\e[5;32;40mManufacturer (channel1, channel2, channel3 channels)\e[m************************************'
docker exec cli.Manufacturer bash -c 'peer channel list'
sleep ${FABRIC_START_WAIT}
echo -e '******\e[5;32;40mSupplier1  (channel1, channel2 channels)\e[m************************************'
docker exec cli.Supplier1 bash -c 'peer channel list'
sleep ${FABRIC_START_WAIT}
echo -e '******\e[5;32;40mSupplier1A ( channel1 channel)\e[m************************************'
docker exec cli.Supplier1A bash -c 'peer channel list'
sleep ${FABRIC_START_WAIT}
echo -e '******\e[5;32;40mSupplier1B ( channel2 channel)\e[m************************************'
docker exec cli.Supplier1B bash -c 'peer channel list'
sleep ${FABRIC_START_WAIT}
echo -e '******\e[5;32;40mSupplier2 (channel3 channel)\e[m************************************'
docker exec cli.Supplier2 bash -c 'peer channel list'
sleep ${FABRIC_START_WAIT}
echo -e '******\e[5;32;40mSupplier2A (channel3 channel)\e[m************************************'
docker exec cli.Supplier2A bash -c 'peer channel list'
sleep ${FABRIC_START_WAIT}
echo -e '******\e[5;32;40mAgency (channel1,channel2,channel3 channels)\e[m************************************'
docker exec cli.Agency bash -c 'peer channel list'
