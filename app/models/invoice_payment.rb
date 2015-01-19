class InvoicePayment < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :payment_rule

  validates :payment_rule, presence: true, uniqueness: { scope: :invoice_id }

  def amount
    invoice.amount * payment_rule.percent / 100.0
  end

  def reference_time
    case payment_rule.since_name
    when 'date_of_order' then invoice.ordered_at
    when 'date_of_shipping' then invoice.shipped_at
    when 'date_of_invoice' then invoice.invoiced_at
    when 'date_of_delivery' then invoice.delivered_at
    end
  end

  def start_time
    if !reference_time.nil?
      time = reference_time

      if payment_rule.end_of_month?
        time = time.end_of_month
      end

      time + payment_rule.period.days
    end
  end
end
