class WorkerBase
  include Sidekiq::Worker

  def perform(*args)
    @task_id = args.last
    @task_args = args[0..-2]
    pre_process
    begin
      process(*@task_args)
      @task_result = :success
    rescue
      #TODO 异常邮件通知
      @task_result = :fail
    end
    post_process
  end

  private
  def pre_process
    BackTask.update(@task_id, task_status: :processing)
  end

  def post_process
    BackTask.update(@task_id, task_status: @task_result)
  end
end
