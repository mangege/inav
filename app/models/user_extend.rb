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
  }.freeze

  DEFAULT_BREAD_CRUMB_TEMPLATE = <<-EOS
{% for link in links %}
  <a href="{{link.url}}">{{link.title}}</a> &gt; 
{% endfor %}
  EOS
  DEFAULT_BREAD_CRUMB_TEMPLATE.freeze

  DEFAULT_RELATED_CAT_TEMPLATE = <<-EOS
TODO
  EOS
  DEFAULT_RELATED_CAT_TEMPLATE.freeze


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

  def show_shop_title?
    settings[:show_shop_title] == 'true'
  end

  def show_item_title?
    settings[:show_item_title] == 'true'
  end

  def bread_crumb_liquid_template
    @bread_crumb_liquid_template ||= Liquid::Template.parse(
      bread_crumb_template || UserExtend::DEFAULT_BREAD_CRUMB_TEMPLATE )
  end

  def related_cat_liquid_template
    @related_cat_liquid_template ||= Liquid::Template.parse(
      related_cat_template || UserExtend::DEFAULT_RELATED_CAT_TEMPLATE )
  end
end
