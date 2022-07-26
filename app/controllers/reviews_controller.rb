class ReviewsController < ApplicationController
  def index
    render :index
  end

  def search
    @name = params[:name]
    begin
      if params[:commit] == 'Search (Filter)'
        @reviews = Review.filter_comments(@name)
      else
        @reviews = UnfilteredReview.filter_comments(@name)
      end
    rescue NoMethodError
      flash[:alert] = "Can't find a game by that name. Please make sure you have the exact name of the game"
      redirect_to reviews_path
      return
    end
    render :results
  end

  def results
    render :results
  end
end