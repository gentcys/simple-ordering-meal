class Meal < ApplicationRecord
  CUT_OFF_AT = 'Every %s, %s'

  def cut_off_at
    CUT_OFF_AT % [cut_off_at_time_of_day.strftime('%H:%M'), Date::DAYNAMES[cut_off_at_day_of_week]]
  end

  def exceeds_cut_off?
    now = Time.now.utc

    return true if now.wday > cut_off_at_day_of_week
    return false if now.wday < cut_off_at_day_of_week

    now.hour >= cut_off_at_time_of_day.hour
  end

  def self.most_popular(limit: 10)
    order(score: :desc).limit(limit)
  end
end
