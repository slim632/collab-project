require 'rails_helper'

RSpec.describe Youtube::Client do
  subject { described_class.new }

  describe '#videos' do
    context 'when successful response' do
      before do
        stub_request(:get, "#{Youtube::Client::BASE_URL}/videos?page=1")
          .with(headers: { 'Accept' => '*/*' })
          .to_return(status: 200, body: '[{"id": 1, "title": "Test Video"}]', headers: {})
      end

      it 'returns a list of videos' do
        expect(subject.videos(page: 1)).to eq([{ 'id' => 1, 'title' => 'Test Video' }])
      end
    end

    context 'when API request fails' do
      before do
        stub_request(:get, "#{Youtube::Client::BASE_URL}/videos?page=1")
          .to_return(status: 500)
      end

      it 'raises an APIError' do
        expect { subject.videos(page: 1) }.to raise_error(Youtube::Client::APIError)
      end
    end
  end
end
