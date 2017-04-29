FactoryGirl.define do
  factory :user do
     sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'password'
    password_confirmation 'password'
    created_at Date.today
    updated_at Date.today + 1.day
  end
end
