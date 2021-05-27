class WeekDay
  attr_accessor :wday

  def initialize(wday)
    @wday = wday
  end

  def to_date
    c_wday = self.class.current_wday
    day_distance = (c_wday - @wday).abs
    today = Date.current

    c_wday >= @wday ? today - day_distance : today + day_distance
  end

  def to_time(hour, minute, second)
    date = to_date

    Time.new(date.year, date.month, date.day, hour, minute, second, "+00:00")
  end

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
