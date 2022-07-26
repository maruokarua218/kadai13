FactoryBot.define do
  factory :user do
    namae { '管理者です' }
    email { 'admin@admin.com' }
    password { 'admin@admin.com' }
    password_confirmation { 'admin@admin.com' }
    admin { true }
  end
end
