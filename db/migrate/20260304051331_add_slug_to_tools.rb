class AddSlugToTools < ActiveRecord::Migration[8.1]
  def change
    add_column :tools, :slug, :string
    add_index :tools, :slug
  end
end
