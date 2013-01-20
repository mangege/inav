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
      @task_result = :fail
      Util.log_exception($!)
    end
    post_process
  rescue
    Util.log_exception($!)
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
