class Friendship < ApplicationRecord
  belongs_to :active_user, class_name: :User
  belongs_to :passive_user, class_name: :User

  def self.friends_pending(a_id)
    return Friendship.all.where("active_user_id = ? AND status = ?", a_id, "PENDING")
  end

  def self.accept_request(p_id, a_id)
    fs_a = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", a_id, p_id).first
    fs_p = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", p_id, a_id).first
    fs_a.status = "FRIENDS"
    fs_p.status = "FRIENDS"
    fs_a.save
    fs_P.save
    return "FRIENDS"
  end

  def self.all_friends(a_id)
    return Friendship.all.where("active_user_id = ? AND status = ?", a_id, "FRIENDS")
  end

  def self.friends?(a_id, p_id)
    fs_a = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", a_id, p_id)
    fs_p = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", p_id, a_id)
    return fs_a.length > 0 && fs_p.length > 0 ? true : false
  end

  def self.requested?(a_id, p_id)
    fs_a = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", a_id, p_id)
    fs_p = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", p_id, a_id)
    return fs_a.length > 0 || fs_p.length > 0 ? true : false
  end

  def self.check_status(a_id, p_id)
    fs_a = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", a_id, p_id)
    fs_p = Friendship.all.where("active_user_id = ? AND passive_user_id = ?", p_id, a_id)
    if fs_a.length > 0 && fs_p.length > 0
      fs_a.first.status = "FRIENDS"
      fs_p.first.status = "FRIENDS"
      fs_a.first.save
      fs_p.first.save
      return "FRIENDS"
    else
      return "PENDING"
    end
  end
end
