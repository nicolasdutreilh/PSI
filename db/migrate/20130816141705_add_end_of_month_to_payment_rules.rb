class AddEndOfMonthToPaymentRules < ActiveRecord::Migration
  def change
    add_column :payment_rules, :end_of_month, :boolean, default: false, null: false
  end
end
