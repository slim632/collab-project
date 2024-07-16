require 'rails_helper'

RSpec.describe Youtube::Provider do

  class MockClient
    def videos(page: nil)
    end
  end

  let(:client) { MockClient.new }

  subject { described_class.new(client: client) }

  describe '#list' do
    context 'when successful response' do
      before do
        allow(client).to receive(:videos).and_return([{ 'id' => 1, 'title' => 'Test Video' }])
      end

      it 'returns a list of videos' do
        expect(subject.list(page: 1)).to eq([{ 'id' => 1, 'title' => 'Test Video' }])
      end
    end

    context 'when client raises error' do
      before do
        allow(client).to receive(:videos).and_raise(Youtube::Client::APIError)
      end

      it 'raises UnavailableError' do
        expect { subject.list(page: 1) }.to raise_error(Youtube::Provider::UnavailableError)
      end
    end
  end
end
