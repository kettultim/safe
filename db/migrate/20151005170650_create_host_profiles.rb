class CreateHostProfiles < ActiveRecord::Migration
  def change
    create_table :host_profiles do |t|
      t.string :name
      t.string :country

      t.timestamps null: false
    end
  end
end
