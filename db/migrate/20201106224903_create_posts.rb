class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :users_full_name
      t.string :users_avatar
      t.string :img, default: ''
      t.string :text
      t.date :posted_at, default: DateTime.now.to_date

      t.timestamps
    end
  end
end
