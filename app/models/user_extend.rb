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
当前分类:
{% for link in links %}
  <a href="{{link.url}}" target="_blank">{{link.title}}</a>
  {% unless forloop.last %} &gt; {% endunless %}
{% endfor %}
  EOS
  DEFAULT_BREAD_CRUMB_TEMPLATE.freeze

  DEFAULT_RELATED_CAT_TEMPLATE = <<-EOS
<br />
相关分类:
{% for link in links %}
  <a href="{{link.url}}" target="_blank">{{link.title}}</a>
  {% unless forloop.last %} | {% endunless %}
{% endfor %}
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

  ['show_shop_title?', 'show_item_title?', 'show_parent_cat?', 'logoff_taobao?'].each do |p_name|
     define_method(p_name) do
       settings[p_name[0..-2].to_sym] == 'true'
     end
  end

  def bread_crumb_liquid_template
    @bread_crumb_liquid_template ||= Liquid::Template.parse(get_bread_crumb_template)
  end

  def get_bread_crumb_template
    bread_crumb_template || UserExtend::DEFAULT_BREAD_CRUMB_TEMPLATE 
  end

  def related_cat_liquid_template
    @related_cat_liquid_template ||= Liquid::Template.parse(get_related_cat_template)
  end

  def get_related_cat_template
    related_cat_template || UserExtend::DEFAULT_RELATED_CAT_TEMPLATE
  end
end
