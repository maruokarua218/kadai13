class Task < ApplicationRecord
  validates :title, presence: true
  enum status:{
    完了:1,着手中:2,未着手:3
  }
end
