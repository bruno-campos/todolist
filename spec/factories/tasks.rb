# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}"}
    user
  end
end
