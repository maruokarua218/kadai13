class User < ApplicationRecord
  has_many :tasks
  before_update :admin_cannot_update
  before_destroy :admin_cannot_delete
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def admin_cannot_update
   if User.where(admin: true).count == 1 && self.admin_change == [true, false]
      throw :abort
    end
  end

  def admin_cannot_delete
   if User.where(admin: true).count == 1 && self.admin == true
      throw :abort
    end
  end
end
