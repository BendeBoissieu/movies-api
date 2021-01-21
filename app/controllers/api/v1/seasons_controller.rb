class Api::V1::SeasonsController < ApplicationController

  def index
    expires_in 5.minutes, public: true

    @seasons = Season.all.order("created_at DESC")
    render :index, status: :ok
  end
end
