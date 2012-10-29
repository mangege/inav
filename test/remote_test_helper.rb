# -*- encoding : utf-8 -*-
require 'test_helper'

WebMock.disable!

class ActiveSupport::TestCase
  def default_remote_user_attrs
    @default_remote_user_attrs ||= MultiJson.load( File.read("#{Rails.root}/tmp/default_test_user.json") )
  end
end
