# -*- encoding : utf-8 -*-
module ApplicationHelper
  def page_title(title)
    @page_title = title
  end

  def render_page_title
    if @page_title
      "#{@page_title} - #{AppConfig.site_name}"
    else
      AppConfig.site_name
    end
  end

  def notice_class
    if flash[:error]
      'alert-error'
    elsif flash[:alert]
      ''
    else
      'alert-info'
    end
  end

  def render_notice_text
    flash[:error] || flash[:alert] || flash[:notice]
  end

  def add_back_task_link(link_name, task_type, link_options = {})
    options = {}
    options[:method] = :post
    options.merge!(link_options)
    link_to(link_name, back_tasks_path(task_type: task_type), options)
  end

  def nav_link(name, link)
    li_options = {}
    li_options[:class] = "active" if current_page?(link)
    content_tag(:li, li_options) do
      link_to(name, link)
    end
  end
end
