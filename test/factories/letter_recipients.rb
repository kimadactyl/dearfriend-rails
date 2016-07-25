FactoryGirl.define do
  factory :letter_recipient do
    association :recipient
    association :letter
  end
end
