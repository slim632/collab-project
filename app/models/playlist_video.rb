class PlaylistVideo < ApplicationRecord
  validates :playlist_id, :video_id, presence: true
  validates :video_id, uniqueness: { scope: :playlist_id }

  belongs_to :playlist
  belongs_to :video
end
