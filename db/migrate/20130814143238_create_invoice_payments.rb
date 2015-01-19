class CreateInvoicePayments < ActiveRecord::Migration
  def change
    create_table :invoice_payments do |t|
      t.references :invoice, index: true, null: false
      t.references :payment_rule, index: true, null: false
      t.boolean :paid, default: false, null: false

      t.timestamps
    end

    add_index :invoice_payments, [:invoice_id, :payment_rule_id], unique: true
  end
end
