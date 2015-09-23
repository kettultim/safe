class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menu_id
      t.string :link_url
      t.string :link_label
      t.integer :weight

      t.timestamps null: false
    end
  end
end
