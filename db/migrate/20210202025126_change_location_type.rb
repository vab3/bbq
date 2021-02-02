class ChangeLocationType < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :type, :location_type
  end
end
