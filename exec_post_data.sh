#!/bin/bash -eux

# 外部ファイルから環境変数を読み込む
source ./.add_env

rbenv local 2.7.0
bundle exec ruby ./post_mac_address.rb
