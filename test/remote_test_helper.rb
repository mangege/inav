# -*- encoding : utf-8 -*-
require 'test_helper'

system("bundle exec rails r -e development #{Rails.root}/lib/tasks/remote_testing.rb")

class RemoteTestCase < ActiveSupport::TestCase
  def default_remote_user_attrs
      @default_remote_user_attrs ||= MultiJson.load( File.read("#{Rails.root}/tmp/default_test_user.json") )
  end

  def default_remote_user
    user = User.find_by_taobao_user_id(default_remote_user_attrs['taobao_user_id'])
    if user.nil?
      user = User.new(@default_remote_user_attrs, without_protection: true)
      user.save!
    end
    user
  end

  def setup
    WebMock.disable!
  end

  def teardown
    WebMock.enable!
  end
end
