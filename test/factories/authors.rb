FactoryGirl.define do
  factory :author do
    first_name "Author"
    last_name "Name"
  end

  factory :second_author, class: Author do
    first_name "Second"
    last_name "Author"
  end

  factory :third_author, class: Author do
    first_name "Third"
    last_name "Author"
  end
end
