module CalendarHelper
  def css_label_for_payment(event)
    if event.paid?
      'success'
    elsif event.start_time < Time.now
      'important'
    elsif event.start_time < Time.now + 7.days
      'warning'
    else
      'default'
    end
  end
end
