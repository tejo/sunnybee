class CreateMeteoLocations < ActiveRecord::Migration
  def self.up
    create_table :meteo_locations do |t|
      t.string  :street_address, :full_address, :zip, :precision, :state, :city, :country_code,:location_id
      t.boolean :success
      t.float :lat, :lng
      t.timestamps
    end
  end

  def self.down
    drop_table :meteo_locations
  end
end
