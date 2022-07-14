class Task < ApplicationRecord
  validates :title, presence: true
  enum status:{ 完了:1,着手中:2,未着手:3 }

  scope :search_title, -> (search) {where('title LIKE ?', "%#{search}%")}
  scope :search_status, -> (status) {where(status: status)}

  # scope :search_name, -> (name) {where("name LIKE ?", "%#{name}%")}
  # scope :search_status, -> (status) {where(status: status)}
end
