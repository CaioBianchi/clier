class AddRoleToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :role, :integer, default: 0, null: false

    reversible do |dir|
      dir.up do
        User.find_by(id: 1)&.update(role: 1)
      end
    end
  end
end
