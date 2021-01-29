class AddFieldsToVendor < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :phone, :string
    add_column :vendors, :hours, :string
    add_column :vendors, :website, :string
    add_column :vendors, :status, :integer
  end
end
