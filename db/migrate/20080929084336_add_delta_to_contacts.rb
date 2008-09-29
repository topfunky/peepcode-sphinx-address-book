class AddDeltaToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :delta, :boolean, :default => false
    
    add_index :contacts, :delta
  end

  def self.down
    remove_column :contacts, :delta
  end
end
