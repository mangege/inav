# -*- encoding : utf-8 -*-
module Taobao
  TIME_FORMAT = '%Y-%m-%d %H:%M:%S'

  autoload(:OAuth2, 'taobao_lib/oauth2')
  autoload(:HttpSign, 'taobao_lib/http_sign')
  autoload(:Client, 'taobao_lib/client')
  autoload(:Collection, 'taobao_lib/collection')
  autoload(:Api, 'taobao_lib/api')
  autoload(:Field, 'taobao_lib/field')

  class Error < StandardError ; end
  class ClientError < Error
    attr_reader :data
  end

  class ResponseError < ClientError
    def initialize(error_response)
      super("淘宝远程调用响应出错 #{error_response.inspect}")
      @data = error_response
    end
  end
  class UnknownError < ClientError
    def initialize(body)
      super("淘宝远程调用发生未知错误")
      @data = body
    end
  end
end
