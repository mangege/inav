# -*- encoding : utf-8 -*-
class BackTasksController < ApplicationController
  layout 'management'
  before_filter :check_params, only: :index

  def index
    @back_tasks = current_user.back_tasks
  end

  def create
    task_add_result = BackTask.send(params[:task_type], current_user)
    if task_add_result
      flash.notice = "后台任务添加成功"
    else
      flash.alert = "后台任务添加失败,有可能已存在此类任务"
    end
    redirect_to back_tasks_path
  end

  private
  def check_params
    if %w[sync_shop].include?(params[:task_type])
      flash.alert = "参数有误,请重试"
      redirect_to root_path
    end
  end
end
