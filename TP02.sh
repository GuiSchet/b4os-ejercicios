sudo ln -s $(pwd)/bitcoin-27.0/bin/bitcoind /usr/local/bin/
sudo ln -s $(pwd)/bitcoin-27.0/bin/bitcoin-cli /usr/local/bin/
mkdir ~/.bitcoin

echo "rpcconnect=52.214.22.54" >> ~/.bitcoin/bitcoin.conf
echo "rpcuser=user_083" >> ~/.bitcoin/bitcoin.conf
echo "rpcpassword=Tej59pSEfH96" >> ~/.bitcoin/bitcoin.conf

bitcoind -daemon

sudo apt update
sudo apt install jq

