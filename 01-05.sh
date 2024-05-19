#005.sh In this exercise, we aim to show how absolute timelock works.
#    Create a Transaction with an absolute timelock of 150, this transaction will fund the multisig address with 100 BTC from Trader and the change-back to Trader accounting for fees
#    Sign and broadcast the transaction.
#    Your final command should answer the question: What is the final line of command ´bitcoin-cli sendrawtransaction txhex´?

bitcoin-cli createwallet "Test"
Alice=$(bitcoin-cli getnewaddress)
Bob=$(bitcoin-cli getnewaddress)
Alice_pubkey=$(bitcoin-cli -named getaddressinfo address=$Alice | jq -r '.pubkey')
echo $Alice_pubkey
Bob_pubkey=$(bitcoin-cli -named getaddressinfo address=$Bob | jq -r '.pubkey')
echo $Bob_pubkey
MULTISIG=$(bitcoin-cli createmultisig 2 '["'$Alice_pubkey'", "'$Bob_pubkey'"]')
multisig_address=$(echo $MULTISIG | jq -r '.address')
echo $multisig_address

## https://github.com/BlockchainCommons/Learning-Bitcoin-from-the-Command-Line/blob/master/04_2_Creating_a_Raw_Transaction.md

Trader=$(bitcoin-cli getnewaddress)
Trader_pubkey=$(bitcoin-cli -named getaddressinfo address=$Trader | jq -r '.pubkey')
bitcoin-cli generatetoaddress 7 $Trader
utxo=$(bitcoin-cli listunspent | jq -r '.[0]')
utxo_txid=$(bitcoin-cli listunspent | jq -r '.[0] | .txid') 
utxo_vout=$(bitcoin-cli listunspent | jq -r '.[0] | .vout')
rawtxhex=$(bitcoin-cli -named createrawtransaction inputs='''[ { "txid": "'$utxo_txid'", "vout": '$utxo_vout' } ]''' outputs='''{ "'$multisig_address'": 45, "'$Trader'": 4.999 }''' locktime=1500)
signedtx=$(bitcoin-cli -named signrawtransactionwithwallet hexstring=$rawtxhex | jq -r '.hex')
bitcoin-cli -named sendrawtransaction hexstring=$signedtx
