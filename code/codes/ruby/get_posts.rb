require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/get_posts

# 글 목록 조회
# 특정 밴드의 글 목록을 조회합니다.글 목록은 최신순으로 정렬되어 제공됩니다.

# ポストのリスト照会
# 特定のBANDのポストのリストを照会。 
# リストは最新の順序で並べられています。

params = {
    'band_key' => 'INPUT YOUR BAND KEY'
}
response = get_request('https://openapi.band.us/v2/band/posts', params)
pp response

result_data = response['result_data']
properties = ['items', 'paging']
puts validate?(result_data, properties)

items = result_data['items']
properties = ['author', 'post_key', 'content', 'comment_count', 'created_at', 'photos', 'emotion_count', 'band_key']
items.each do |item|
    puts validate?(item, properties)
end

paging = result_data['paging']
properties = ['previous_params', 'next_params']
puts validate?(paging, properties)