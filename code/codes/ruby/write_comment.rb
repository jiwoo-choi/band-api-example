require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/write_comment

# 댓글 작성
# 특정 글에 댓글을 작성합니다.

# コメント作成
# 特定のポストにコメントを作成。

params = {
    'band_key' => 'INPUT YOUR BAND KEY',
    'post_key' => 'INPUT YOUR POST KEY',
    'body' => "한글 日本語\nアイウエオ\n\nあいうえお\n\n\nEnglish"
}
response = post_request('https://openapi.band.us/v2/band/post/comment/create', params)
pp response

result_data = response['result_data']
properties = ['message']
puts validate?(result_data, properties)

message = result_data['message']
raise "NOT SUCCESS" unless message == 'success'