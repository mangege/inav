# -*- encoding : utf-8 -*-
module Taobao
  extend ::ActiveSupport::Autoload
  TIME_FORMAT = '%Y-%m-%d %H:%M:%S'

  autoload(:OAuth2)
  autoload(:HttpSign)
  autoload(:Client)
  autoload(:Collection)
  autoload(:Api)
  autoload(:Field)

  class Error < StandardError ; end
  class ClientError < Error
    attr_reader :data
  end

  class ResponseError < ClientError
    def initialize(error_response)
      super("淘宝远程调用响应出错 #{error_response.inspect}")
      @data = error_response
    end

    %w[code msg sub_code sub_msg].each do |name|
      define_method(name){@data[name]}
    end
  end
  class UnknownError < ClientError
    def initialize(body)
      super("淘宝远程调用发生未知错误")
      @data = body
    end
  end
end
