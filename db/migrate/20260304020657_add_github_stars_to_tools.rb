class AddGithubStarsToTools < ActiveRecord::Migration[8.1]
  def change
    add_column :tools, :github_stars, :integer
  end
end
