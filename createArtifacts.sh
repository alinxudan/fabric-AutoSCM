#!/bin/bash

export FABRIC_START_WAIT=3
export FABRIC_CFG_PATH=./

echo -e "\e[5;32;40mgenerating certificates in crypto-config folder for all entities\e[m "
../bin/cryptogen generate --config crypto-config.yaml
sleep ${FABRIC_START_WAIT}



echo -e "\e[5;32;40mgenerating geneis block\e[m "
mkdir artifacts
../bin/configtxgen -profile AutoOrdererGenesis -outputBlock ./artifacts/genesis.block

echo -e "\e[5;32;40mcreate the channel configuration blocks with this configuration file, by using the other profiles\e[m "

mkdir channels
../bin/configtxgen -profile Channel1 -outputCreateChannelTx ./channels/channel1.tx -channelID channel1
sleep ${FABRIC_START_WAIT}
../bin/configtxgen -profile Channel2 -outputCreateChannelTx ./channels/channel2.tx -channelID channel2
sleep ${FABRIC_START_WAIT}
../bin/configtxgen -profile Channel3 -outputCreateChannelTx ./channels/channel3.tx -channelID channel3
sleep ${FABRIC_START_WAIT}

echo -e "\e[5;32;40mgenerate the anchor peer update transactions\e[m "


../bin/configtxgen -profile Channel1 -outputAnchorPeersUpdate ./channels/channel1anchor.tx -channelID channel1 -asOrg ManufacturerMSP
sleep ${FABRIC_START_WAIT}
../bin/configtxgen -profile Channel2 -outputAnchorPeersUpdate ./channels/channel2anchor.tx -channelID channel2 -asOrg Supplier1MSP
sleep ${FABRIC_START_WAIT}
../bin/configtxgen -profile Channel3 -outputAnchorPeersUpdate ./channels/channel3anchor.tx -channelID channel3 -asOrg Supplier2MSP
