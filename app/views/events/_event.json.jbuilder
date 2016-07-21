json.extract! event, :id, :start, :finish, :title, :description, :street1, :street2, :city, :postcode, :eventbrite, :facebook, :created_at, :updated_at
json.url event_url(event, format: :json)