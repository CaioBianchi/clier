class AddProfileFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
  end
end
