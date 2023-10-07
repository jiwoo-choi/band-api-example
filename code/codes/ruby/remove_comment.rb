require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/remove_comment

# 댓글 삭제
# 특정 댓글을 삭제합니다. 동일한 Client ID에서 작성된 댓글을 삭제할 수 있습니다.

# コメント削除
# 特定のコメントを削除。 
# 同じClient IDが作成したコメントを削除できます。

params = {
    'band_key' => 'INPUT YOUR BAND KEY',
    'post_key' => 'INPUT YOUR POST KEY',
    'comment_key' => 'INPUT YOUR COMMENT KEY'
}
response = post_request('https://openapi.band.us/v2/band/post/comment/remove', params)
pp response

result_data = response['result_data']
properties = ['message']
puts validate?(result_data, properties)

message = result_data['message']
raise "NOT SUCCESS" unless message == 'success'