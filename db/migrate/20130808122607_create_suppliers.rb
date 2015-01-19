class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :identifier, null: false
      t.string :name, null: false
      t.text :address, null: false
      t.text :shipping_address, null: false
      t.string :contact_name
      t.string :contact_mail
      t.string :phone, null: false
      t.string :fax

      t.timestamps
    end

    add_index :suppliers, :identifier, unique: true
  end
end
