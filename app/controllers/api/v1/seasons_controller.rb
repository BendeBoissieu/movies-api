class Api::V1::SeasonsController < ApplicationController
  def index
    @seasons = Season.all
    render :index, status: :ok
  end
end
