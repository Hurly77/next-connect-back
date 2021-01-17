class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :users_avatar
      t.string :users_full_name
      t.date :posted_at, default: DateTime.now.to_date
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
