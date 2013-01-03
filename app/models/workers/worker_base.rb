# -*- encoding : utf-8 -*-
class WorkerBase
  include Sidekiq::Worker

  def perform(user_id, task_id)
    @task_id = task_id
    pre_process
    begin
      process(user_id)
      @task_result = :success
    rescue
      #TODO 异常邮件通知
      @task_result = :fail
    end
    post_process
  end

  private
  def find_back_task
    BackTask.find(@task_id)
  end

  def pre_process
    task = find_back_task
    task.task_status = :processing
    task.save!
  end

  def post_process
    task = find_back_task
    task.task_status = @task_result
    task.save!
  end
end
