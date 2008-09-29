class AddGeoFields < ActiveRecord::Migration
  def self.up
    add_column :contacts, :latitude,  :float
    add_column :contacts, :longitude, :float
  end

  def self.down
    remove_column :contacts, :latitude
    remove_column :contacts, :longitude
  end
end
