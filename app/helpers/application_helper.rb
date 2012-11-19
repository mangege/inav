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

  def notice_class
    if flash[:error]
      'error'
    elsif flash[:alert]
      'warning'
    else
      'info'
    end
  end

  def render_notice_text
    flash[:error] || flash[:alert] || flash[:notice]
  end
end
