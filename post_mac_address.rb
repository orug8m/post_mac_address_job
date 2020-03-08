#!/usr/bin/env ruby -eux

require 'faraday'
require 'uri'

def fetch_mac_address_list
  value=`echo ${ROOT_PASS} | sudo -S arp-scan -l --interface en0`
  list = value.split(/\n/)

  pattern = /^192.168.[\d|\d{2}|\d{3}].[\d|\d{2}|\d{3}]/

  list.map {|i| i.split(/\t/) if i.split(/\t/)[0] && i.split(/\t/)[0].match(pattern)}.compact
end

def make_mac_address_list(data)
  data.map{|i| i[1] }
end

def make_mac_address_and_maker_list(data)
  data.map{|i| {i[1] => i[2]} }
end

url = ENV['AUTO_KINTAI_APP_DOMAIN'] + '/kintai_status'
data = fetch_mac_address_list
mac_address_list = make_mac_address_list(data)
mac_address_and_maker_list = make_mac_address_and_maker_list(data)

data = {
  mac_address_list: mac_address_list.join(','),
  mac_address_and_maker_list: mac_address_and_maker_list.join(',')
}

def post_data(url, data)
  Faraday.post(url) do |req|
    req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
    req.body = URI.encode_www_form(data)
  end
end

response = post_data(url, data)
puts response.inspect
