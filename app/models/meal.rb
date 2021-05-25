class Meal < ApplicationRecord
  CUT_OFF_AT = "Every %s, %s"

  def cut_off_at
    CUT_OFF_AT % [cut_off_at_time_of_day.strftime('%H:%M'), Date::DAYNAMES[cut_off_at_day_of_week - 1]]
  end
end
