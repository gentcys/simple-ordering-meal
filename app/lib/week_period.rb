class WeekPeriod
  attr_accessor :beginning, :end

  def initialize(time)
    week_day = WeekDay.wday(time)
    first_week_day_distance = week_day - 0
    last_week_day_distance = 6 - week_day

    @beginning = Time.new(time.year, time.month, time.day - first_week_day_distance, 0, 0, 0, "+00:00")
    @end = Time.new(time.year, time.month, time.day + last_week_day_distance, 23, 59, 59, "+00:00")
  end

  class << self
    def current
      new(Time.now.utc)
    end
  end
end
