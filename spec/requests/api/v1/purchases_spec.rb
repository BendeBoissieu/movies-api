require 'rails_helper'

RSpec.describe 'Purchases API', type: :request do
  #initialization
  User.destroy_all
  Movie.destroy_all
  user1 = User.create(email: "test@test.com")
  movie = Movie.create(title: "movie1")
  season = Season.create(title: "season1")
  purchase_option = PurchaseOption.create(price: 10.0, video_quality: "SD", movie_id: movie.id)
  user_id = user1.id.to_s

  describe 'GET /api/v1/users/user_id/purchases' do
    before do
      get '/api/v1/users/'+user_id+ '/purchases'
    end

    it 'return the purchase if it was created less than 2 days' do
      purchase = Purchase.new(user_id: user1.id, purchase_option_id: purchase_option.id)
      get '/api/v1/users/'+user_id+'/purchases'
      expect(json).to eq({"movies"=>[{"title"=>"movie1"}], "seasons"=>[]})
    end
    it 'does not return the purchase if it was created more than 2 days' do
      purchase = Purchase.new(user_id: user1.id, purchase_option_id: purchase_option.id, created_at: 3.days.ago)
      get '/api/v1/users/'+user_id+'/purchases'
      expect(json).to eq({"movies"=>[], "seasons"=>[]})
    end


    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/users/user_id/purchases" do
    it 'create a purchase with valid attributes' do
      purchase_params = { purchase_option_id: purchase_option.id}
      post '/api/v1/users/'+user_id+'/purchases', :params => purchase_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end

    it 'should not create the purchase if the purchase was done less than 3 days ago' do
      purchase = Purchase.create(user_id: user1.id, purchase_option_id: purchase_option.id)
      purchase_params = { purchase_option_id: purchase_option.id}
      post '/api/v1/users/'+user_id+'/purchases', :params => purchase_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'create the purchase if the purchase was done more than 3 days ago' do
      purchase = Purchase.create(user_id: user1.id, purchase_option_id: purchase_option.id, created_at: 3.days.ago)
      purchase_params = { purchase_option_id: purchase_option.id}
      post '/api/v1/users/'+user_id+'/purchases', :params => purchase_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end


  end
end

