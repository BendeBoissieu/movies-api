class Api::V1::LibrariesController < ApplicationController
  def index
    @movies = Movie.all
    @seasons = Season.all
    render :index, status: :ok
  end
end
