### 003.sh: How many new outputs were created by block 123,456?
block_height=123456
block_hash=$(bitcoin-cli getblockhash $block_height)
block=$(bitcoin-cli getblock $block_hash 3)
transactions=$(echo $block | jq '.tx[]')
txids=$(echo $transactions | jq -r '.txid')

# Obtener las transacciones del bloque
block_transactions=$(echo "$block" | jq -c '.tx[]')



