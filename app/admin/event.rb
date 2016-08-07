ActiveAdmin.register Event do

  permit_params :start, :finish, :title, :description, :street1, :street2, :city, :postcode, :eventbrite, :facebook

end
