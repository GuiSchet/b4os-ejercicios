##005.sh: Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
##    37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517

txid="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"
tx_info=$(bitcoin-cli getrawtransaction $txid true)
vin=$(echo $tx_info | jq -r '.vin[]')
vin0=$(echo $tx_info | jq -r '.vin[0]')
vin1=$(echo $tx_info | jq -r '.vin[1]')
vin2=$(echo $tx_info | jq -r '.vin[2]')
vin3=$(echo $tx_info | jq -r '.vin[3]')
prev_txid0=$(echo $vin0 | jq -r '.txid')
vout0=$(echo $vin0 | jq -r '.vout')
prev_txid1=$(echo $vin1 | jq -r '.txid')
vout1=$(echo $vin1 | jq -r '.vout')
prev_txid2=$(echo $vin2 | jq -r '.txid')
vout2=$(echo $vin2 | jq -r '.vout')
prev_txid3=$(echo $vin3 | jq -r '.txid')
vout3=$(echo $vin3 | jq -r '.vout')
echo $prev_txid0
echo $prev_txid1
echo $prev_txid2
echo $prev_txid3

prev_tx_info0=$(bitcoin-cli getrawtransaction $prev_txid0 true)
scriptSig0=$(echo "$prev_tx_info0" | jq -r ".vout[$vout0].scriptPubKey.asm")
pubkey0=$(echo $scriptSig0 | awk '{print $2}')
echo $pubkey0

prev_tx_info1=$(bitcoin-cli getrawtransaction $prev_txid1 true)
scriptSig1=$(echo "$prev_tx_info1" | jq -r ".vout[$vout1].scriptPubKey.asm")
pubkey1=$(echo $scriptSig1 | awk '{print $2}')
echo $pubkey1

prev_tx_info2=$(bitcoin-cli getrawtransaction $prev_txid2 true)
scriptSig2=$(echo "$prev_tx_info2" | jq -r ".vout[$vout2].scriptPubKey.asm")
pubkey2=$(echo $scriptSig2 | awk '{print $2}')
echo $pubkey2

prev_tx_info3=$(bitcoin-cli getrawtransaction $prev_txid3 true)
scriptSig3=$(echo "$prev_tx_info3" | jq -r ".vout[$vout3].scriptPubKey.asm")
pubkey3=$(echo $scriptSig3)
echo $pubkey3

multisig=$(bitcoin-cli createmultisig 1 "[\"$pubkey0\",\"$pubkey1\",\"$pubkey2\",\"$pubkey3\"]")
echo $multisig