class Api::V1::PurchasesController < ApplicationController
  def index
    user = User.find(params["user_id"].to_i)

    purchases = Purchase.includes(:purchase_option).where(user_id: user.id).where("created_at > ?", 2.days.ago)

    movie_ids = purchases.map{|purchase| purchase.purchase_option.movie_id}.compact
    season_ids = purchases.map{|purchase| purchase.purchase_option.season_id}.compact

    @movies = Movie.where(id: movie_ids)
    @seasons = Season.where(id: season_ids)

    render :index, status: :ok
  end

  def create
    purchase = Purchase.new(purchase_params)
    user = User.find(params["user_id"].to_i)
    purchase.user = user

    #ADD RULES

    if purchase.save
      render json: {status: 'SUCCESS', message: 'purchase created', data: purchase}, status: :ok
    else
      render json: {status: 'ERROR', message: 'purchase not saved', data: purchase.errors}, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.permit(:purchase_option_id, :user_id)
  end
end
