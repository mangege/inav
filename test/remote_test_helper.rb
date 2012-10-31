# -*- encoding : utf-8 -*-
require 'test_helper'

WebMock.disable!

class ActiveSupport::TestCase
  def default_remote_user_attrs
    if @default_remote_user_attrs.nil?
      system('bundle exec rails r lib/tasks/remote_testing.rb')
      @default_remote_user_attrs = MultiJson.load( File.read("#{Rails.root}/tmp/default_test_user.json") )
    end
    @default_remote_user_attrs
  end
end
