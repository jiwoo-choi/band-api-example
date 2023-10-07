require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/get_albums

# 앨범 목록 조회
# 특정 밴드의 앨범목록을 조회합니다. 목록은 등록 순서순으로 정렬되어 제공됩니다.

# アルバムリスト照会
# 特定のBANDのアルバムのリストを照会。 
# リストは登録の順序で並べられています。

params = {
    'band_key' => 'INPUT YOUR BAND KEY'
}
response = get_request('https://openapi.band.us/v2/band/albums', params)
pp response

result_data = response['result_data']
properties = ['items', 'paging']
puts validate?(result_data, properties)

items = result_data['items']
properties = ['latest_photos', 'created_at', 'photo_count', 'owner', 'photo_album_key', 'name']
items.each do |item|
    puts validate?(item, properties)
end

paging = result_data['paging']
properties = ['previous_params', 'next_params']
puts validate?(paging, properties)