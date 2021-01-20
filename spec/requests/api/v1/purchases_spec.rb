require 'rails_helper'

RSpec.describe 'Purchases API', type: :request do
  #initialization
  User.destroy_all
  Movie.destroy_all
  user1 = User.create(email: "test@test.com")
  movie = Movie.create(title: "movie1")
  purchase_option = PurchaseOption.create(price: 10.0, video_quality: "SD", movie_id: movie.id)
  user_id = user1.id.to_s

  describe 'GET /api/v1/users/user_id/purchases' do
    before do
      get '/api/v1/users/'+user_id+ '/purchases'
    end

    it 'does not return the purchase if older than 2 days' do
      purchase = Purchase.new(user_id: user1.id, purchase_option_id: purchase_option.id, created_at: 3.days.ago)
      get '/api/v1/users/'+user_id+ '/purchases'
      expect(json).to eq({"movies"=>[], "seasons"=>[]})
    end

    it 'return the purchase if it was created before 2 days' do
      purchase = Purchase.new(user_id: user1.id, purchase_option_id: purchase_option.id, created_at: 1.days.ago)
      get '/api/v1/users/'+user_id+ '/purchases'
      expect(json).to eq({"movies"=>[{"title"=>"movie1"}], "seasons"=>[]})
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end

