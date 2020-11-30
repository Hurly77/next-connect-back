class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :connect_id
      t.string :status
      t.string :avatar, default: ''
      
      t.timestamps
    end
  end
end