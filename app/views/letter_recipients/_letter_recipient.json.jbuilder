json.extract! letter_recipient, :id, :recipient_id, :letter_id, :created_at, :updated_at
json.url letter_recipient_url(letter_recipient, format: :json)