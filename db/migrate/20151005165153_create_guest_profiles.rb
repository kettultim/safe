class CreateGuestProfiles < ActiveRecord::Migration
  def change
    create_table :guest_profiles do |t|
      t.string :name
      t.string :country
      t.text :story

      t.timestamps null: false
    end
  end
end
