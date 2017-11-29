FactoryBot.define do
  factory :note do
    association :user, factory: :user
    sequence(:title) { |n| "title#{n}" }
    body 'This is a new note!'
  end
end
