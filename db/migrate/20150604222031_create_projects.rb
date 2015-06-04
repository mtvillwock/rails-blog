class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :month
      t.string :img_src
      t.string :deploy_url
      t.string :github_url
      t.string :tagline
      t.text :description
      t.string :summary
    end
  end
end
