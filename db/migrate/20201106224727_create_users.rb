class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :avatar, default: Faker::Avatar.image
      t.string :work, default: ''
      t.string :education, default: ''
      t.string :relationship, default: ''
      t.string :lives, default: ''
      t.string :from, default: ''
      t.date :joined, default: DateTime.now.to_date

      t.string :c_id
      
      t.timestamps
    end
  end
end
