class AddSpotlightedToTools < ActiveRecord::Migration[8.1]
  def change
    add_column :tools, :spotlighted, :boolean, default: false, null: false
  end
end
