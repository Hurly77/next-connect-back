class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_secure_password
  validates_presence_of :email
end
