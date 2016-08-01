FactoryGirl.define do
  factory :recipient do
    first_name "Recipient"
    last_name "Name"
    description "long recipient description"
    born "1920-01-01"
    died "1980-05-01"
    website "http://example.com"

    factory :second_recipient do
      first_name "Second"
      last_name "Recipient"
      description "second recipient description"
    end

    factory :third_recipient do
      first_name "Third"
      last_name "Recipient"
      description "third recipient description"
    end
  end

end
