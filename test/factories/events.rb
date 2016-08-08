FactoryGirl.define do
  factory :event do
    start "2020-07-21 14:00:00"
    finish "2020-07-21 16:00:00"
    title "Dear Friend Workshop"
    description "A long description of the workshop"

    factory :past_event do
      start Date.today - 1.week
      finish Date.today - 1.week + 2.hours
    end
  end
end
