FactoryBot.define do
  factory :task do
    title { 'test_title1' }
    content { 'test_content1' }
    deadline { '002022-07-13-00-00' }
  end
  factory :second_task, class: Task do
    title { 'test_title2' }
    content { 'test_content2' }
    deadline { '002022-07-12-00-00' }
  end
end
