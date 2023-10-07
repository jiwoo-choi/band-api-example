require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/get_bands

# 밴드 목록 조회
# 로그인 사용자가 가입한 밴드의 목록을 조회한다.

# BANDリスト照会
# ログインしたユーザーが加入したBANDのリストを照会。

response = get_request('https://openapi.band.us/v2.1/bands')
pp response

result_data = response['result_data']
properties = ['bands']
puts validate?(result_data, properties)

bands = result_data['bands']
properties = ['name', 'cover', 'member_count', 'band_key']
bands.each do |band|
    puts validate?(band, properties)
end