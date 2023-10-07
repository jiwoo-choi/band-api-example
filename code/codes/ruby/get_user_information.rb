require 'pp'
require_relative '0_env'

# https://developers.band.us/develop/guide/api/get_user_information

# 사용자 정보 조회
# 로그인 사용자의 프로필 정보를 가져온다.

# ユーザー情報照会
# ログインしたユーザーのプロファイル情報を照会。

response = get_request('https://openapi.band.us/v2/profile')
pp response

result_data = response['result_data']
properties = ['name', 'profile_image_url', 'is_app_member', 'message_allowed', 'user_key']
puts validate?(result_data, properties)