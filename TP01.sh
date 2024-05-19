sudo ln -s $(pwd)/bitcoin-27.0/bin/bitcoind /usr/local/bin/
sudo ln -s $(pwd)/bitcoin-27.0/bin/bitcoin-cli /usr/local/bin/
mkdir ~/.bitcoin

echo "regtest=1" >> ~/.bitcoin/bitcoin.conf
echo "fallbackfee=0.0001" >> ~/.bitcoin/bitcoin.conf
echo "server=1" >> ~/.bitcoin/bitcoin.conf
echo "txindex=1" >> ~/.bitcoin/bitcoin.conf
echo "addresstype=legacy" >> ~/.bitcoin/bitcoin.conf


bitcoind -daemon

sleep 5

bitcoin-cli getdifficulty

sudo apt update
sudo apt install jq

