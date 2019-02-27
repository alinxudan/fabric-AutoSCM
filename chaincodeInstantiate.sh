
#!/bin/bash

echo -e "-----------------------'\e[5;32;40m Instantiate chaincodes\e[m---------------------------------------------------------"

echo "---------------Instantiate chaincode on channel1 channel with permission for Manufacturer, Supplier1 and Supplier1A to invoke the chaincode and Agency to have readonly access-------------------"

docker exec cli.Manufacturer bash -c "peer chaincode instantiate -C channel1 -n channel1chaincode -v 0 -c '{\"Args\":[]}'  -P \"OR ('ManufacturerMSP.member', 'Supplier1MSP.member','Supplier1AMSP.member')\""

echo "---------------Instantiate chaincode on channel2 channel with permission for Manufacturer&Supplier1, Manufacturer,Supplier1 and Supplier1B to invoke the chaincode and Agency to have readonly access----------------------------"
docker exec cli.Supplier1 bash -c "peer chaincode instantiate -C channel2 -n channel2chaincode -v 0 -c '{\"Args\":[]}' -P \"OR ('Supplier1MSP.member', 'Supplier1BMSP.member','ManufacturerMSP.member')\""

echo "---------------Instantiate chaincode on channel3 channel with permission for Supplier2 ,Manufacturer,Supplier2 and Supplier2A  to invoke the chaincode and Agency to have readonly access----------------------------"
docker exec cli.Supplier2 bash -c "peer chaincode instantiate -C channel3 -n channel3chaincode -v 0 -c '{\"Args\":[]}' -P \"OR ('Supplier2MSP.member', 'Supplier2AMSP.member','ManufacturerMSP.member')\""

echo -e "----------------------'\e[5;32;40m END\e[m\'---------------------------------------------------------"
