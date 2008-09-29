class Contact < ActiveRecord::Base
  belongs_to :state
  
  define_index do
    indexes [first_name, last_name], :as => :name, :sortable => true
    indexes street_address, city, country, postal_code
    
    has state_id
    has latitude, longitude
  end
end
