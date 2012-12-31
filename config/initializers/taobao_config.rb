# -*- encoding : utf-8 -*-
class LoadConfig
  def self.process!(hash, keys)
    keys.concat(hash.keys).uniq.each do |key|
      val = hash[key]
      raise(ArgumentError, "配置#{key}不能为空") if val.nil?
      hash[key] = val.strip if val.respond_to?(:strip)
    end
    hash
  end
end

TAOBAO_CONFIG = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'taobao.yml'))).result)[Rails.env].with_indifferent_access
LoadConfig.process!(TAOBAO_CONFIG, %w[app_key app_secret oauth2_site api_site])
