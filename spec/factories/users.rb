FactoryGirl.define do
  factory :user do
    email do |n|
      "person#{n}@example.com"
    end
    created_at Date.today
    updated_at Date.today + 1.day
  end
end
