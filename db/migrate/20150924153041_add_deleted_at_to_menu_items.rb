class AddDeletedAtToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :deleted_at, :datetime
    add_index :menu_items, :deleted_at
  end
end
