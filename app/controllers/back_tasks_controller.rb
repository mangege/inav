# -*- encoding : utf-8 -*-
class BackTasksController < ApplicationController
  layout 'management'
  before_filter :check_params, only: :create

  def index
    @back_tasks = current_user.back_tasks.order('id DESC').page(params[:page]).per(10)
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
    unless BackTask::TASK_TYPE_NAMES.keys.include?(params[:task_type].to_sym)
      flash.alert = "参数有误,请重试"
      redirect_to action: :index
    end
  end
end
