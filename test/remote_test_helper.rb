# -*- encoding : utf-8 -*-
require 'test_helper'

WebMock.disable!
system("bundle exec rails r -e development #{Rails.root}/lib/tasks/remote_testing.rb")

class ActiveSupport::TestCase
  def default_remote_user_attrs
      @default_remote_user_attrs ||= MultiJson.load( File.read("#{Rails.root}/tmp/default_test_user.json") )
  end
end
