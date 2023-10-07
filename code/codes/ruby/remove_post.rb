require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/remove_post

# 글 삭제
# 특정 글을 삭제하는 API 입니다.

# ポスト削除
# 特定のポストを削除。

params = {
    'band_key' => 'INPUT YOUR BAND KEY',
    'post_key' => 'INPUT YOUR POST KEY'
}
response = post_request('https://openapi.band.us/v2/band/post/remove', params)
pp response

result_data = response['result_data']
properties = ['message']
puts validate?(result_data, properties)

message = result_data['message']
raise "NOT SUCCESS" unless message == 'success'