require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/get_post_permission

# 쓰기/삭제 권한 조회 API
# 로그인 사용자가 특정 밴드에 쓰기/삭제 권한을 가지고 있는지 조회합니다.
# 밴드 리더의 설정에 따라 사용자가 가입해 있는 밴드이지만 글쓰기/댓글쓰기 권한이 없는 경우도 있으니, 
# 이 API 조회 결과를 확인 후에 권한이 있는 경우에만 글쓰기/댓글쓰기를 시도하면 됩니다.

# 権限照会API
# ログインしたユーザーの特定のBANDのWRITE / DELETE権限を照会。
# BANDのリーダーの設定によっては、BANDに加入してもポストやコメントの作成の権限がない場合もあります。
# このAPIを利用して、ポストやコメントの作成権限を確認することができます。

params = {
    'band_key' => 'INPUT YOUR BAND KEY',
    'permissions' => ['posting', 'commenting', 'contents_deletion']
}
response = get_request('https://openapi.band.us/v2/band/permissions', params)
pp response

result_data = response['result_data']
properties = ['permissions']
puts validate?(result_data, properties)