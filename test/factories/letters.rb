FactoryGirl.define do
  factory :letter do
    recieved "2016-07-21 14:07:05"
    published "2016-07-21 14:07:05"
    is_draft false
    content "MyText"
  end
end
