class PaymentRule < ActiveRecord::Base
  SINCE_VALUES = ['date_of_order', 'date_of_shipping', 'date_of_invoice', 'date_of_delivery']

  validates :name, presence: true
  validates :percent, presence: true, numericality: true
  validates :period, presence: true, numericality: { only_integer: true }
  validates :since, presence: true, uniqueness: { scope: [:percent, :period] }

  def since_name
    SINCE_VALUES[since]
  end
end
