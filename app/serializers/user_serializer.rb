class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :id
  has_many :posts
  has_many :comments
end
