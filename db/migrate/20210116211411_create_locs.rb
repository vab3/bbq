class CreateLocs < ActiveRecord::Migration[6.0]
  def change
    create_table :locs do |t|
      t.belongs_to :vendor, :index => true, :foreign_key => true
      t.string :latitude
      t.string :longitude
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
