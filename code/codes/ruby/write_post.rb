require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/write_post

# 글 쓰기
# 특정 밴드에 글을 작성합니다.

# ポスト作成
# 特定のBANDにポストを作成。

params = {
    'band_key' => 'INPUT YOUR BAND KEY',
    'content' => "한글 日本語\nアイウエオ\n\nあいうえお\n\n\nEnglish"
}
response = post_request('https://openapi.band.us/v2.2/band/post/create', params)
pp response

result_data = response['result_data']
properties = ['band_key', 'post_key']
puts validate?(result_data, properties)