class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.string :external_id, null: false
      t.text :description
      t.string :thumbnail_url
      t.integer :view_count
      t.timestamps
    end

    add_index :videos, :title
    add_index :videos, :external_id, unique: true
  end
end
