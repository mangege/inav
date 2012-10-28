# -*- encoding : utf-8 -*-
module ApplicationHelper
  def page_title(title)
    @page_title = title
  end

  def render_page_title
    if @page_title
      "#{@page_title} - iNav"
    else
      "iNav"
    end
  end
end
