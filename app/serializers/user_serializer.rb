class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email
  has_many :posts
  has_many :comments
end
