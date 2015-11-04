class AddFeaturesSpacesTable < ActiveRecord::Migration
  def change
    create_table :features_spaces, id: false do |t|
      t.belongs_to :feature, index: true
      t.belongs_to :space, index: true
    end
  end
end
