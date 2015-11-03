class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, limit: 150
      t.string :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
