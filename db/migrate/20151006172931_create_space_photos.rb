class CreateSpacePhotos < ActiveRecord::Migration
  def change
    create_table :space_photos do |t|
      t.integer :space_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
