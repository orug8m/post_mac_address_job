require 'faraday'
require 'uri'

def fetch_mac_address_list
  value=`echo ${ROOT_PASS} | sudo -S arp-scan -l --interface en0`
  list = value.split(/\n/)

  pattern = /^192.168.[\d|\d{2}|\d{3}].[\d|\d{2}|\d{3}]/

  devices = list.map {|i| i.split(/\t/) if i.split(/\t/)[0] && i.split(/\t/)[0].match(pattern)}.compact
  devices.map{|i| i[1]}
end

url = 'http://localhost:7777/kintai_status'
puts mac_address_list = fetch_mac_address_list
data = { mac_address_list: mac_address_list.join(',') }

def post_data(url, data)
  Faraday.post(url) do |req|
    req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
    req.body = URI.encode_www_form(data)
  end
end

response = post_data(url, data)
puts response.inspect
