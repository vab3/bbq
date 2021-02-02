class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.belongs_to :vendor, :index => true, :foreign_key => true
      t.integer :type
      t.string :latitude
      t.string :longitude
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :hours
      t.string :phone
      t.timestamps
    end
  end
end
