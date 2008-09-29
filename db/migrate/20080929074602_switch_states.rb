class SwitchStates < ActiveRecord::Migration
  def self.up
    select_values(
      "SELECT DISTINCT state FROM contacts"
    ).each do |state|
      State.create :name => state
    end
    
    add_column :contacts, :state_id, :integer
    add_index  :contacts, :state_id
    
    Contact.find(:all).each do |contact|
      contact.update_attributes(
        :state_id => State.find_by_name(contact.attributes["state"]).id
      )
    end
    
    remove_column :contacts, :state
  end

  def self.down
    add_column :contacts, :state, :string
    
    Contact.find(:all).each do |contact|
      execute "UPDATE contacts SET state = '#{contact.state.name}' WHERE id = #{contact.id}"
    end
    
    remove_column :contacts, :state_id
    
    State.find(:all).each { |state| state.destroy }
  end
end
