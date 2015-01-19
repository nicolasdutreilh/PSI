module ApplicationHelper
  def display_value(value)
      value.present? ? value : 'Not available'
  end

  def display_text(text)
    split_paragraphs(text).join('<br /><br />').html_safe
  end

  def display_datetime(datetime)
    datetime.present? ? l(value) : 'Not available'
  end

  def display_mail_to(address, name = nil)
    address.present? ? mail_to(address, (name if name.present?)) : 'Not available'
  end
end
