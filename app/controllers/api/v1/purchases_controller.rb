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

    purchase_option_id = params["purchase_option_id"].to_i
    purchase_options = PurchaseOption.where(id: purchase_option_id)

    if purchase_options.blank?
      render json: {status: 'ERROR', message: 'this purchase option does not exist', data: purchase.errors}, status: :unprocessable_entity
    else
      new_purchase_option = purchase_options.first

      # all previous purchases from the user
      all_purchases = hash_all_purchases(user.id)
      if !is_existing_same_content?(user.id, new_purchase_option, all_purchases)
        if purchase.save
          render json: {status: 'SUCCESS', message: 'purchase created', data: purchase}, status: :ok
        else
          render json: {status: 'ERROR', message: 'purchase not saved', data: purchase.errors}, status: :unprocessable_entity
        end
      else
        render json: {status: 'ERROR', message: 'same purchase already created recently', data: purchase.errors}, status: :unprocessable_entity
      end
    end

  end

  private

  def purchase_params
    params.permit(:purchase_option_id, :user_id)
  end

  # hash with the previous purchases and creation date from the user
  def hash_all_purchases(user_id)
    all_purchases = {}
    purchases = Purchase.where(user_id: user_id)
    purchases.each do |purchase|
      if purchase.purchase_option.movie_id
        all_purchases["movie"] = {purchase.purchase_option.movie_id => purchase.created_at}
      elsif purchase.purchase_option.season_id
        all_purchases["season"] = {purchase.purchase_option.season_id => purchase.created_at}
      end
    end
      return all_purchases
  end

  # checking if a previous same content exist and is older than 3 days
  def is_existing_same_content?(user_id, new_purchase_option, all_purchases)
    if new_purchase_option.movie_id
      movie_id = new_purchase_option.movie_id
      if all_purchases["movie"] && all_purchases["movie"][movie_id]
        if all_purchases["movie"][movie_id] > 3.days.ago
          return true
        end
      end
    elsif new_purchase_option.season_id
      season_id = new_purchase_option.season_id
      if all_purchases["season"] && all_purchases["season"][season_id]
        if all_purchases["season"][season_id] > 3.days.ago
          return true
        end
      end
    end
    return false
  end

end
