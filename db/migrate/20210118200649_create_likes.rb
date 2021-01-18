class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.post_id :integer
      t.user_id :integer

      t.timestamps
    end
  end
end
