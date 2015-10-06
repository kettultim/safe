class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :space_id
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
