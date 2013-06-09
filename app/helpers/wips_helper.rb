module WipsHelper

  def display_day_before(datetime)
    datetime.yesterday.strftime("%Y-%m-%d")
  end

  def display_date(datetime)
    datetime.strftime("%Y-%m-%d")
  end

  def display_time(datetime)
    datetime.strftime("%H:%m")
  end

  def display_day_after(datetime)
    datetime.tomorrow.strftime("%Y-%m-%d")
  end

end