class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
