# -*- encoding : utf-8 -*-
module Taobao
  class HttpSign
    class << self
      def sign(hash)
        hash = hash.with_indifferent_access
        #TODO 删除图片类型
        hash.delete(:sign)
        default_params!(hash)
        app_secret = hash.delete(:app_secret)
        keys = hash.keys.sort
        str = ''
        str << app_secret
        keys.each do |key|
          str << key.to_s
          str << hash[key].to_s
        end
        str << app_secret
        hash[:sign] = Digest::MD5.hexdigest(str).upcase
        hash
      end

      private
      def default_params!(hash)
        hash[:sign_method] = 'md5'
        hash[:v] = '2.0' unless hash.key?(:v)
        hash[:format] = 'json' unless hash.key?(:format)
        hash[:app_key] = TaobaoConfig.app_key unless hash.key?(:app_key)
        hash[:app_secret] = TaobaoConfig.app_secret unless hash.key?(:app_secret)
        hash[:timestamp] = Time.now.strftime(TIME_FORMAT) unless hash.key?(:timestamp)
        hash
      end
    end
  end
end