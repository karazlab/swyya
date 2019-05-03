class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
