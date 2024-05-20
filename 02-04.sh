##004.sh: Using descriptors, compute the taproot address at index 100 derived from this extended public key:
xpub=xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2

# Deriva la dirección taproot en el índice 100 utilizando la xpub

xpub="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"

descriptor_info=$(bitcoin-cli getdescriptorinfo "tr($xpub/*)")

descriptor=$(echo $descriptor_info | jq -r '.descriptor')

addresses=$(bitcoin-cli deriveaddresses "$descriptor" "[100,100]")
echo $addresses
