# -*- encoding : utf-8 -*-
module Taobao
  autoload(:OAuth2, 'taobao/oauth2')
  autoload(:HttpSign, 'taobao/http_sign')

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
