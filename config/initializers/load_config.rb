# -*- encoding : utf-8 -*-
TAOBAO_CONFIG = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'taobao.yml'))).result)[Rails.env].to_options
TAOBAO_CONFIG.assert_valid_keys(:app_key, :app_secret, :oauth2_site, :api_site)
TAOBAO_CONFIG.each do |k, v|
  raise(ArgumentError, "淘宝配置#{k}不能为空") if v.nil?
  TAOBAO_CONFIG[k] = v.strip if v.is_a? String
end
