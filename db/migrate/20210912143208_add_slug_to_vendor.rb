class AddSlugToVendor < ActiveRecord::Migration[6.0]
  def up
    add_column :vendors, :slug, :string
    Vendor.all.each do |v|
      v.update(slug: v.name.parameterize)
    end
    change_column_null :vendors, :slug, false
  end

  def down
    remove_column :vendors, :slug
  end
end
