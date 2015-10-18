class AddFieldsToHostProfile < ActiveRecord::Migration
  def change
    add_column :host_profiles, :about, :text
    add_column :host_profiles, :phone, :string
    add_column :host_profiles, :twitter, :string

    rename_column :guest_profiles, :story, :about
    add_column :guest_profiles, :phone, :string
    add_column :guest_profiles, :twitter, :string
    add_column :guest_profiles, :number_living_with, :integer
  end
end
