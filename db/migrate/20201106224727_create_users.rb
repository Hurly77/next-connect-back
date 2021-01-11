class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :photo_url, null: true
      t.string :banner_url, null: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :work, default: ''
      t.string :education, default: ''
      t.string :relationship, default: ''
      t.string :lives, default: ''
      t.string :from, default: ''
      t.string :c_id
      t.date :joined, default: DateTime.now.to_date
      
      t.timestamps
    end
  end
end
