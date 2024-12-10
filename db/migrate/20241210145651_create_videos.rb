class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :link_video
      t.string :cover_image

      t.timestamps
    end
  end
end
