FactoryBot.define do
 factory :user do
 email { Faker::Internet.email }
 password { "password" }
 password_confirmation { "password" }
 role { :standard }
 end
end
