# -*- encoding : utf-8 -*-
user_file = "#{Rails.root}/tmp/default_test_user.json"
unless File.exist?(user_file)
  nick = TaobaoConfig.test_user_nick
  user = User.find_by_taobao_user_nick(nick)
  raise "开发环境没有用户 #{nick} 授权信息,请先授权" if user.nil?
  raise "开发环境用户 #{nick} 授权已过期,请先授权" if user.oauth2_expired?
  File.write(user_file, user.attributes.to_json)
end
