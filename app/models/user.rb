class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_secure_password
  validate_presence_of :email
  validate_uniqness_of :email
end
