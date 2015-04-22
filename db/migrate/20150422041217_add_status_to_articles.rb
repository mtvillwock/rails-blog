class AddStatusToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :status, :string, default: "draft"
  end
end
