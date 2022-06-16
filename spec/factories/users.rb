FactoryBot.define do
  factory :user do
    name { 'Adam' }
    sequence(:email) { |n| "#{name}#{n}@gmail.com" }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'user' }
  end
end
