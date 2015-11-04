class AddFieldsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :number_of_rooms, :integer
    add_column :spaces, :number_of_people_allowed, :integer
  end
end
