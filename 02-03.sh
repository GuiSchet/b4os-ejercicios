### 003.sh: How many new outputs were created by block 123,456?
block_height=123456
block_hash=$(bitcoin-cli getblockhash $block_height)
block=$(bitcoin-cli getblock $block_hash 3)
transactions=$(echo $block | jq '.tx[]')
txids=$(echo $transactions | jq -r '.vout')
echo $txids



# Obtener las transacciones del bloque
#total_outputs=0
#for tx in $transactions; do
#    outputs=$(echo "$tx" | jq '.vout | length')
#    total_outputs=$((total_outputs + outputs))
#done

#echo "Número total de nuevas salidas en el bloque 123,456: $total_outputs"


