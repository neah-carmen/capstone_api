class User < ApplicationRecord
  has_many :edibles

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
