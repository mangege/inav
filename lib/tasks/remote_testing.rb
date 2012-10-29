# -*- encoding : utf-8 -*-
user = User.find_by_taobao_user_nick('sandbox_c_1')
raise "开发环境没有用户 sandbox_c_1 授权信息,请先授权" if user.nil?
raise "开发环境用户 sandbox_c_1 授权已过期,请先授权" if user.oauth2_expired?
File.write("#{Rails.root}/tmp/default_test_user.json", user.attributes.to_json)
