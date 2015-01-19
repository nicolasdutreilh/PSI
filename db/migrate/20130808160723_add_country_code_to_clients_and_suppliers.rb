class AddCountryCodeToClientsAndSuppliers < ActiveRecord::Migration
  def change
    add_column :clients, :country_code, :string, null: false
    add_column :suppliers, :country_code, :string, null: false
  end
end
