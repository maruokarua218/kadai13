class Task < ApplicationRecord
  validates :title, presence: true
  enum status:{ 完了:1,着手中:2,未着手:3 }
  enum priority:{ 中:1,低:2,高:3 }

  scope :search_title, -> (search) {where('title LIKE ?', "%#{search}%")}
  scope :search_status, -> (status) {where(status: status)}

end
