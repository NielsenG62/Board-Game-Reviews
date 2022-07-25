class ReviewsController < ApplicationController
  def index
    render :index
  end

  def search
    @name = params[:name]
    if params[:commit] == 'Search (Filter)'
      @reviews = Review.filter_comments(@name)
    else
      @reviews = UnfilteredReview.filter_comments(@name)
    end
    render :results
  end

  def results
    render :results
  end
end