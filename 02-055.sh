txid="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"
# Get the raw transaction and decode it
decoded_tx=$(bitcoin-cli getrawtransaction $txid true)

# Extract the public keys from the inputs using txinwitness
PUBKEYS=$(echo "$decoded_tx" | jq -r '[.vin[].txinwitness[1]] | map("\"" + . + "\"") | join(", ")')

echo "PUBKEYS: [$PUBKEYS]"

# Create a 1-of-4 multisig address
multisig=$(bitcoin-cli createmultisig 1 "[$PUBKEYS]")

# Output the multisig address and redeem script
echo "Multisig Address and Redeem Script:"
echo "$multisig"