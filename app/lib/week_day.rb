class WeekDay
  class << self
    def current_wday
      (Time.now.utc.wday + 6) % 7
    end

    def wday(time)
      (time.wday + 6) % 7
    end

    def previous
      current_wday.positive? ? current_wday - 1 : 0
    end

    def next
      current_wday == 6 ? 6 : current_wday + 1
    end
  end
end
