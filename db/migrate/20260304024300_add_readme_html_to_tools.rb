class AddReadmeHtmlToTools < ActiveRecord::Migration[8.1]
  def change
    add_column :tools, :readme_html, :text
  end
end
