class Video < ApplicationRecord
  validates :title, :external_id, presence: true
  validates :external_id, uniqueness: true
end
