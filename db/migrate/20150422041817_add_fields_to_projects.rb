class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string
    add_column :projects, :url_title, :string
    add_column :projects, :description, :text
    add_column :projects, :status, :string
    add_column :projects, :month, :string
    add_column :projects, :technologies, :string
    add_column :projects, :summary, :string
  end
end
