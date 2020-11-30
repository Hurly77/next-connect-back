class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :work, null: true
      t.string :education, null: true
      t.string :relationship, null: true
      t.string :lives, null: true
      t.string :from, null: true
      t.date :joined, default: DateTime.now.to_date

      t.integer :connect_id
      
      t.timestamps
    end
  end
end
