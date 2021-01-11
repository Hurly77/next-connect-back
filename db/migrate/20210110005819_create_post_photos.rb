class CreatePostPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :post_photos do |t|
      t.string :url
      t.integer :post_id

      t.timestamps
    end
  end
end
