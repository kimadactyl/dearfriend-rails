FactoryGirl.define do
  factory :letter_author do
    association :author
    association :letter
  end
end
