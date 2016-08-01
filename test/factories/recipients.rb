FactoryGirl.define do
  factory :recipient do
    first_name "Recipient"
    last_name "Name"
    description "long recipient description"
    born "1920-01-01"
    died "1980-05-01"
    website "http://example.com"
  end
end
