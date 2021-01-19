class Api::V1::LibrariesController < ApplicationController
  def index
    @movies = Movie.all.order("created_at DESC")
    @seasons = Season.all.order("created_at DESC")
    render :index, status: :ok
  end
end
