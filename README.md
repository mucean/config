## How to install
1. install proxy tool shadowsocks

```shell
pip install shadowsocks-py
```
2. clone config-encryption git

```shell
git clone git@github.com:mucean/config-encryption.git
```

3. decrypt shadowsocks config file and start

```shell
bash decryption.sh config-encryption/shadowsocks/shadowsocks.json.enc config-encryption/shadowsocks/shadowsocks.json
sslocal -c config-encryption/shadowsocks/shadowsocks.json -d start
```

4. set proxies in network config
5. run init.sh shell script

```shell
bash ./init.sh
```
