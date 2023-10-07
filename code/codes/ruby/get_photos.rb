require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/get_photos

# 사진 목록 조회 API
# 특정 앨범에 포함된 사진목록을 조회합니다.

# 写真リスト照会
# 特定のアルバムに含まれている写真のリストを照会。

params = {
    'band_key' => 'INPUT YOUR BAND KEY',
    'photo_album_key' => 'INPUT YOUR ALBUM KEY'
}
response = get_request('https://openapi.band.us/v2/band/album/photos', params)
pp response

result_data = response['result_data']
properties = ['items', 'paging']
puts validate?(result_data, properties)

items = result_data['items']
properties = ['height', 'width', 'created_at', 'comment_count', 'url', 'emotion_count', 'photo_key', 'author', 'photo_album_key', 'is_video_thumbnail']
items.each do |item|
    puts validate?(item, properties)
end

paging = result_data['paging']
properties = ['previous_params', 'next_params']
puts validate?(paging, properties)