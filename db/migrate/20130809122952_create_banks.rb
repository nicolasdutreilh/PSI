class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :identifier, null: false
      t.string :name, null: false
      t.text :address, null: false

      t.timestamps
    end

    add_index :banks, :identifier, unique: true
  end
end
