require 'rails_helper'

RSpec.describe 'Movies API', type: :request do
  #initialization

  describe 'GET /api/v1/movies' do
    before do
      get '/api/v1/movies'
    end

    it 'returns movies' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
