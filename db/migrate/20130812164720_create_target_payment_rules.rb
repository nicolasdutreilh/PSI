class CreateTargetPaymentRules < ActiveRecord::Migration
  def change
    create_table :target_payment_rules do |t|
      t.references :target, index: true, polymorphic: true, null: false
      t.references :payment_rule, index: true, null: false

      t.timestamps
    end

    add_index :target_payment_rules, [:target_id, :target_type, :payment_rule_id], unique: true, name: :index_target_payment_rules_on_target_and_payment_rule
  end
end
