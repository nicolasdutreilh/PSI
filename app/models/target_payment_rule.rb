class TargetPaymentRule < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  belongs_to :payment_rule

  validates :payment_rule, presence: true, uniqueness: { scope: [:target_id, :target_type] }
end
