# -*- encoding : utf-8 -*-
Dir[File.dirname(__FILE__) + "/taobao/*.rb"].each do |file|
  require file
end

module Taobao
  TIME_FORMAT = '%Y-%m-%d %H:%M:%S'

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
