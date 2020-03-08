# 打刻作業を省くために、WiFiに接続したらSlackに打刻したい
## このjobを回すことで指定したWebアプリにMACアドレスを送信できる

```
# Ruby version
# 2.7.0

$ brew install arp-scan
$ bundle install
```

```
# ROOT_PASS: arp-scan用にホストのpassword,
# AUTO_KINTAI_APP_DOMAIN: 送信先のドメインを記載する
$ touch .add_env

# shebangにrubyを記載しているのでruby記述を省いているがPermissionの設定が必要かも
$ chmod 755 post_mac_address.rb

# cronに記載
$ crontab -e

# exec_post_data.sh経由でpost_mac_address.rbを起動する
* * * * * /bin/bash -lc 'cd ~/作業ディレクトリ && ./exec_post_data.sh'
```

```
# 権限設定が必要かもしれない
$ chmod 755 ./exec_post_data.sh
```
