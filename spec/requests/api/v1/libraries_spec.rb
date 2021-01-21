require 'rails_helper'

RSpec.describe 'Libraries API', type: :request do
  #initialization
  Season.destroy_all
  Movie.destroy_all
  let!(:movies) { create_list(:movie, 10) }
  let!(:seasons) { create_list(:season, 10) }
  describe 'GET /api/v1/libraries' do
    before do
      get '/api/v1/libraries'
    end

    it 'returns libraries' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns movies and seasons' do
      expect(json["movies"].size).to be > 0
      expect(json["seasons"].size).to be > 0
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
