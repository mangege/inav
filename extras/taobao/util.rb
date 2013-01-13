module Taobao
  class Util
    class << self
      def millisecond_to_time(millisecond)
        Time.at(millisecond/1000)
      end

      def to_taobao_time(time)
        time.strftime(TIME_FORMAT)
      end

      def to_taobao_time_from_millisecond(millisecond)
        time = millisecond_to_time(millisecond)
        to_taobao_time(time)
      end

      def now_taobao_time
        to_taobao_time(Time.now)
      end
    end
  end
end
