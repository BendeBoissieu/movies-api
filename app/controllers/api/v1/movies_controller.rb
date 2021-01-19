class Api::V1::MoviesController < ApplicationController
  def index
    @movies = Movie.all.order("created_at DESC")
    render :index, status: :ok
  end
end
