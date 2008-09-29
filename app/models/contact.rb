class Contact < ActiveRecord::Base
  define_index do
    indexes [first_name, last_name], :as => :name
    indexes street_address, city, state, country, postal_code
  end
end
