require 'rails_helper'

RSpec.describe 'Purchases API', type: :request do

  let!(:user1) { User.create(email: "test@test.com") }
  let!(:movie) { Movie.create(title: "movie1") }
  let!(:season) { Season.create(title: "season1") }
  let!(:purchase_option) { PurchaseOption.create(price: 10.0, video_quality: "SD", movie_id: movie.id) }
  let!(:user_id) { user1.id.to_s }

  describe 'GET /api/v1/users/user_id/purchases' do
    let!(:purchase) { Purchase.create(purchase_option_id: purchase_option.id, user_id: user1.id) }

    it 'return the purchase if it was created less than 2 days' do
      get '/api/v1/users/'+user_id+'/purchases'
      expect(json["movies"].length).to eq(1)
    end
    it 'does not return the purchase if it was created more than 2 days' do
      purchase.update(created_at:  3.days.ago)
      get '/api/v1/users/'+user_id+'/purchases'
      expect(json["movies"].length).to eq(0)
      expect(json["seasons"].length).to eq(0)
    end

    it 'returns status code 200' do
      get '/api/v1/users/'+user_id+ '/purchases'
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

