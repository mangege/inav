# -*- encoding : utf-8 -*-
module Taobao
  class HttpSign
    class << self
      def sign(hash)
        #TODO 删除图片类型
        hash.delete(:sign)
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
    end
  end
end
