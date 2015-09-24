class RemoveLevelFromMenuItems < ActiveRecord::Migration
  def up
    remove_column :menu_items, :level
  end

  def down
    add_column :menu_items, :level, :integer
  end
end
