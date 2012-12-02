# -*- encoding : utf-8 -*-
class UserExtend < ActiveRecord::Base
  belongs_to :user
  serialize :settings, Hash

  DEFAULT_SETTINGS = {
    add_bread_crumb: 'true',
    add_related_cat: 'true',
    show_shop_title: 'false',
    show_item_title: 'false',
    show_parent_cat: 'false',
    open_blank: 'false',
    logoff_taobao: 'false'
  }

  def settings
    settings = read_attribute(:settings)
    settings.empty? ? DEFAULT_SETTINGS.dup : settings
  end

  def settings=(settings)
    settings = settings.symbolize_keys
    settings = settings.slice( *UserExtend::DEFAULT_SETTINGS.keys )
    settings = settings.reverse_merge(UserExtend::DEFAULT_SETTINGS)
    write_attribute(:settings, settings)
  end
end
