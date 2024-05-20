##Requires multiple bitcoin-cli commands with jq and bash loops/conditionals
##006.sh: Which tx in block 257,343 spends the coinbase output of block 256,128?
block1=256128
block2=257343
coinbase_txid=$(bitcoin-cli getblock $(bitcoin-cli getblockhash $block1) | jq -r '.tx[0]')
coinbase_vout=0

txids=$(bitcoin-cli getblock $(bitcoin-cli getblockhash $block2) | jq -r '.tx[]')

for txid in $txids; do
    vin_details=$(bitcoin-cli getrawtransaction $txid true | jq -r '.vin[]')
    echo $vin_details
done