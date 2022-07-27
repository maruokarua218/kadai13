FactoryBot.define do
  factory :user do
    id { '0' }
    name { 'qq' }
    email { 'qq@gmail.com' }
    password { 'qqdayo' }
    password_confirmation { 'qqdayo' }
    admin { false }
  end
  factory :second_user, class: User do
    id { '1' }
    name { 'aa' }
    email { 'aa@gmail.com' }
    password { 'aadayo' }
    password_confirmation { 'aadayo' }
    admin { true }
  end
end
