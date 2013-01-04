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
end
