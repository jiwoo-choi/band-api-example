require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/get_comments

# 댓글 목록 조회
# 특정 글에 달린 댓글 목록을 조회합니다.

# コメントリスト照会
# 特定のポストに付いたコメントのリストを照会。

params = {
    'band_key' => 'INPUT YOUR BAND KEY',
    'post_key' => 'INPUT YOUR POST KEY'
}
response = get_request('https://openapi.band.us/v2/band/post/comments', params)
pp response

result_data = response['result_data']
properties = ['items', 'paging']
puts validate?(result_data, properties)

items = result_data['items']
properties = ['created_at', 'emotion_count', 'comment_key', 'sticker', 'photo', 'post_key', 'author', 'band_key', 'is_audio_included', 'content']
items.each do |item|
    puts validate?(item, properties)
end

paging = result_data['paging']
properties = ['previous_params', 'next_params']
puts validate?(paging, properties)