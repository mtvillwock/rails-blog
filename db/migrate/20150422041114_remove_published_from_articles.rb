class RemovePublishedFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :published, :boolean
  end
end
