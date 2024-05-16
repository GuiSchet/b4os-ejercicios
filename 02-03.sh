### 003.sh: How many new outputs were created by block 123,456?
block_height=123456
block_hash=$(bitcoin-cli getblockhash $block_height)
block=$(bitcoin-cli getblock $block_hash 3)
transactions=$(echo $block | jq '.tx[]')
txids=$(echo $transactions | jq -r '.txid')
echo $txids

# Inicializar una variable para contar las salidas
total_outputs=0

# Iterar sobre cada transacción y contar las salidas
for tx in $txids; do
    # Obtener la información de la transacción
    tx_info=$(bitcoin-cli getrawtransaction $tx 1)
    # Contar el número de salidas en la transacción y sumarlo al total
    outputs=$(echo $tx_info | jq '.vout | length')
    total_outputs=$((total_outputs + outputs))
done

echo $total_outputs