class AddAddressFieldsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :locality, :string
    add_column :spaces, :administrative_area, :string
    add_column :spaces, :postal_code, :string
    add_column :spaces, :latitude, :float
    add_column :spaces, :longitude, :float
  end
end
