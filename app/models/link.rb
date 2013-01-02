# -*- encoding : utf-8 -*-
class Link
  attr_accessor :title, :url
  liquid_methods :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end
end
