class Api::V1::SeasonsController < ApplicationController
  def index
    @seasons = Season.all.order("created_at DESC")
    render :index, status: :ok
  end
end
