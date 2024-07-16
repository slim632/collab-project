require 'rails_helper'

RSpec.describe Playlist, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should have_many(:playlist_videos).dependent(:destroy) }
    it { should have_many(:videos).through(:playlist_videos) }
  end
end
