class Playlist < ApplicationRecord
  validates :title, presence: true
  has_many :playlist_videos, dependent: :destroy
  has_many :videos, through: :playlist_videos
end
