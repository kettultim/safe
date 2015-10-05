class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :user_id
      t.string :name
      t.string :country
      t.text :description

      t.timestamps null: false
    end
  end
end
