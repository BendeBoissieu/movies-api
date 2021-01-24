require 'rails_helper'

RSpec.describe 'Seasons API', type: :request do

  let!(:seasons) { create_list(:season, 10) }

  describe 'GET /api/v1/seasons' do
    # make HTTP get request before each example
    before { get '/api/v1/seasons' }

    it 'returns seasons' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
