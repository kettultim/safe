class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title, :string
    add_column :pages, :body, :text
    add_column :pages, :slug, :string
    add_index :pages, :slug, unique: true
  end
end
