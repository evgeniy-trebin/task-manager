class User < ActiveRecord::Base

  has_many :tasks, inverse_of: :user, dependent: :destroy

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 3, maximum: 50}

end
