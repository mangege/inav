# -*- encoding : utf-8 -*-
class Taobao::OAuth2
  def self.oauth2_client
    ::OAuth2::Client.new('21220108', 'c501e204b0e1afeda8406432efe5c0af', :site => 'https://oauth.taobao.com', :authorize_url => '/authorize', :token_url => '/token')
  end

  def self.authorize_url
    client = oauth2_client
    client.auth_code.authorize_url(:redirect_uri => 'http://inav.sdapp.cn/user_sessions/callback')
  end

  def self.result(code)
    client = oauth2_client
    token = client.auth_code.get_token(code, :redirect_uri => 'http://inav.sdapp.cn/user_sessions/callback')
    token.params.merge( {'access_token' => token.token, 'refresh_token' => token.refresh_token} )
  end
end
