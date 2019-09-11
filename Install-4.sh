#!/usr/bin/env bash

ownerpublickey=$(cat ownerpublickey.txt)
activepublickey=$(head -n 2 key1 | tail -1)
producerpublickey=$(head -n 2 key3 | tail -1)
produceraccountname=$(cat produceraccountname.txt)
remcli set action permission $produceraccountname rem regproducer produce -p $produceraccountname@active
remcli set action permission $produceraccountname rem voteproducer vote -p $produceraccountname@active
remcli set action permission $produceraccountname rem claimrewards claim -p $produceraccountname@active
remcli set action permission $produceraccountname rem delegatebw stake -p $produceraccountname@active
remcli set action permission $produceraccountname rem.token transfer transfer -p $produceraccountname@active
remcli system voteproducer prods $produceraccountname $produceraccountname -p $produceraccountname@vote
walletpassword=$(cat walletpass)
echo $walletpassword > producerwalletpass.txt
producerwalletpass=$(cat producerwalletpass.txt)
remcli wallet remove_key $ownerpublickey --password=$producerwalletpass
remcli wallet remove_key $activepublickey --password=$producerwalletpass
rm key1 key2 key3 activekeys domain.txt ownerpublickey.txt produceraccountname.txt producerwalletpass.txt
rm -f ./Install-4.sh