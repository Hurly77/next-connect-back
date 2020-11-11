class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :img, :text
  has_many :comments
  belongs_to :user
end
