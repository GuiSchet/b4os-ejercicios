tx="152b928e97bb9e874da1bd4abdf766ae0cdc7a2f260dad5542967cb414c58489"
data=$(bitcoin-cli gettransaction $tx true false)
echo $data