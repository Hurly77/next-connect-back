class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :active_user_id
      t.integer :passive_user_id
      t.string :status, default: 'PENDING'
      
      t.timestamps
    end
  end
end
