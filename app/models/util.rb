class Util
  class << self
    def log_exception(e)
      if Rails.env.development?
        Rails.logger.warn e.inspect
      else
        ExceptionNotifier::Notifier.background_exception_notification(e).deliver
      end
    end
  end
end
