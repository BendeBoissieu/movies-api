class Api::V1::MoviesController < ApplicationController

  def index
    expires_in 1.minute, public: true

    @movies = Movie.all.order("created_at DESC")
    render :index, status: :ok
  end
end
