class Api::V1::MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render :index, status: :ok
  end
end
