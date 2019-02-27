#!/bin/bash


./createChannels.sh
sleep 5

./checkOrgChannelSubscription.sh
sleep 5

./chaincodeInstallInstantiate.sh
sleep 5

./createLedgerEntries.sh
sleep 5
