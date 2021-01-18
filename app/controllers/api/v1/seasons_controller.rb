class Api::V1::SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end
end
