class CreateTools < ActiveRecord::Migration[8.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :stable_version
      t.string :beta_version
      t.string :website_url
      t.string :github_url
      t.string :image_url

      t.timestamps
    end
  end
end
