class ReviewsController < ApplicationController
  def index
    render :index
  end

  def search
    @name = params[:name]
    begin
      @reviews = Review.filter_comments(@name)
    rescue NoMethodError
      flash[:alert] = "Can't find a game by that name. Please make sure you have the exact name of the game"
      redirect_to reviews_path
      return
    end
    render :results
  end
end