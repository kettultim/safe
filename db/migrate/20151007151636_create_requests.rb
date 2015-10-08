class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :space_id
      t.integer :user_id
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
