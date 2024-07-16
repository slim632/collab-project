require 'rails_helper'

RSpec.describe "Home Page", type: :request do
  describe 'GET /' do
    context 'with pagination' do
      let!(:videos) { create_list(:video, 30) }

      context 'when requesting page within the range' do
        it 'displays message' do
          get root_path, params: { page: 1 }

          included = videos.pluck(:title).any? { |title| response.body.include?(title) }
          expect(included).to be_truthy
        end
      end

      context 'when requesting page out of the range' do
        it 'displays message' do
          get root_path, params: { page: 3 }
          expect(response.body).to include('No videos.')
        end
      end
    end

    context 'with keyword' do
      let!(:video_1) { create(:video, title: 'video one') }
      let!(:video_2) { create(:video, title: 'video two') }

      it 'filters results' do
        get root_path, params: { keyword: 'two' }

        expect(response.body).to include(video_2.title)
        expect(response.body).not_to include(video_1.title)
      end
    end
  end
end
