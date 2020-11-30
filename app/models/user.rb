class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :connections

  def self.query(q) 
     User.where("first_name LIKE ?", "%#{q}%")
  end
end
