FactoryBot.define do
  factory :label do
    name { "テスト1" }
  end
  factory :second_label, class: Label do
    name { "テスト2" }
  end
end
