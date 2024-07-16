class CreatePlaylistVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :playlist_videos do |t|
      t.references :playlist, index: true
      t.references :video, index: true
      t.timestamps
    end

    add_index :playlist_videos, [:playlist_id, :video_id], unique: true
  end
end
