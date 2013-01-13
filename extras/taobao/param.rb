module Taobao
  class Param
    def initialize(hash)
      @hash = hash.with_indifferent_access
    end

    def to_param
      add_sys_default
      HttpSign.sign(@hash)
      @hash
    end

    private
    def add_sys_default
      @hash[:sign_method] = 'md5'
      @hash[:v] = '2.0' unless @hash.key?(:v)
      @hash[:format] = 'json' unless @hash.key?(:format)
      @hash[:app_key] = TaobaoConfig.app_key unless @hash.key?(:app_key)
      @hash[:app_secret] = TaobaoConfig.app_secret unless @hash.key?(:app_secret)
      @hash[:timestamp] = Taobao::Util.now_taobao_time unless @hash.key?(:timestamp)
    end

  end
end
