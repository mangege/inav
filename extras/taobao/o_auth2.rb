# -*- encoding : utf-8 -*-
module Taobao
  class OAuth2
    class << self
      def oauth2_client
        ::OAuth2::Client.new(TaobaoConfig.app_key, TaobaoConfig.app_secret, :site => TaobaoConfig.oauth2_site, :authorize_url => '/authorize', :token_url => '/token')
      end

      def authorize_url
        client = oauth2_client
        client.auth_code.authorize_url(:redirect_uri => "http://#{AppConfig.site_domain}/user_sessions/callback")
      end

      def result(code)
        client = oauth2_client
        token = client.auth_code.get_token(code, :redirect_uri => "http://#{AppConfig.site_domain}/user_sessions/callback")
        params = token.params.merge( {'access_token' => token.token, 'refresh_token' => token.refresh_token, 'oauth2_updated_at' => Time.now,
                           :expires_in => token.expires_in} )
        params['taobao_user_nick'] = URI.unescape(params['taobao_user_nick']) unless params['taobao_user_nick'].empty?
        params
      end
    end
  end
end
