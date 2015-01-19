class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :recipient, index: true, polymorphic: true, null: false
      t.string :identifier, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.date :ordered_at, null: false
      t.date :shipped_at
      t.date :invoiced_at
      t.date :delivered_at

      t.timestamps
    end

    add_index :invoices, :identifier, unique: true
  end
end
