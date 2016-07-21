json.extract! recipient, :id, :first_name, :last_name, :description, :dob, :website, :is_living, :created_at, :updated_at
json.url recipient_url(recipient, format: :json)