class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :identifier, null: false
      t.string :name, null: false
      t.string :contact
      t.text :address, null: false
      t.string :phone, null: false
      t.string :fax

      t.timestamps
    end

    add_index :clients, :identifier, unique: true
  end
end
