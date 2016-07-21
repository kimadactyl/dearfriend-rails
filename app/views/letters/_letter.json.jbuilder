json.extract! letter, :id, :recieved, :published, :is_draft, :content, :created_at, :updated_at
json.url letter_url(letter, format: :json)