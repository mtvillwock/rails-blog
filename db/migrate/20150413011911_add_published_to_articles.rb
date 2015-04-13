class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :summary, :boolean, default: false
  end
end
