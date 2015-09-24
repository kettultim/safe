class AddLevelToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :level, :integer
  end
end
