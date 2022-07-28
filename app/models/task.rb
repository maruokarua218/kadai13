class Task < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  belongs_to :user
  validates :title, presence: true
  enum status:{ 未着手:1,着手中:2,完了:3 }
  enum priority:{ 低:1,中:2,高:3 }

  scope :search_title, -> (search) {where('title LIKE ?', "%#{search}%")}
  scope :search_status, -> (status) {where(status: status)}

end
