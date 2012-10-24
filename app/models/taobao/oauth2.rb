# -*- encoding : utf-8 -*-
class Taobao::OAuth2
  class << self
    def oauth2_client
      ::OAuth2::Client.new(TAOBAO_CONFIG[:app_key], TAOBAO_CONFIG[:app_secret], :site => TAOBAO_CONFIG[:oauth2_site], :authorize_url => '/authorize', :token_url => '/token')
    end

    def authorize_url
      client = oauth2_client
      client.auth_code.authorize_url(:redirect_uri => "http://#{TAOBAO_CONFIG[:main_domain]}/user_sessions/callback")
    end

    def result(code)
      client = oauth2_client
      token = client.auth_code.get_token(code, :redirect_uri => "http://#{TAOBAO_CONFIG[:main_domain]}/user_sessions/callback")
      token.params.merge( {'access_token' => token.token, 'refresh_token' => token.refresh_token} )
    end
  end
end
