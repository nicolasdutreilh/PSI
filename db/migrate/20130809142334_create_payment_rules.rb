class CreatePaymentRules < ActiveRecord::Migration
  def change
    create_table :payment_rules do |t|
      t.string :name, null: false
      t.decimal :percent, null: false
      t.integer :period, null: false
      t.integer :since, null: false

      t.timestamps
    end

    add_index :payment_rules, [:percent, :period, :since], unique: true
  end
end
