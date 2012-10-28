# -*- encoding : utf-8 -*-
require 'login_system'
class ApplicationController < ActionController::Base
  include LoginSystem
  protect_from_forgery
  before_filter :login_required
end
