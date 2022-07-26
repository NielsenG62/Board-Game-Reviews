class ReviewsController < ApplicationController
  def index
    render :index
  end

  def search
    @name = params[:name]
    begin
      if params[:commit] == 'Search (Filter)'
        @reviews = Review.filter_comments(@name)
        @method = 'Filtered'
      else
        @reviews = UnfilteredReview.filter_comments(@name)
        @method = 'Unfiltered'
      end
    rescue NoMethodError
      flash[:alert] = "Can't find a game by that name. Please make sure you have the exact name of the game"
      redirect_to reviews_path
      return
    end
    render :results
  end
end