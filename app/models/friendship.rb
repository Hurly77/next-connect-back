class Friendship < ApplicationRecord
  belongs_to :active_user, class_name: :User
  belongs_to :passive_user, class_name: :User

  def self.accept_request(p_id, a_id)
    fs_a = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", p_id, a_id).first
    fs_p = Friendship.find_or_create_by(active_user_id: a_id, passive_user_id: p_id)
    fs_a.status = "FRIENDS"
    fs_p.status = "FRIENDS"
    fs_a.save
    fs_p.save
    return "FRIENDS"
  end

  def self.requested?(a_id, p_id)
    fs_a = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", a_id, p_id)
    fs_p = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", p_id, a_id)
    return fs_a[0] && !fs_p[0] ? true : false
  end
end
