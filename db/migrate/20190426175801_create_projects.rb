class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :github_link
      t.integer :status, default: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
