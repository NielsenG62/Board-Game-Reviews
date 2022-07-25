class ReviewsController < ApplicationController
  def index
    render :index
  end

  def search
    @name = Review.filter_comments(params[:name])
    render :results
  end

  def results
    
    render :results
  end
end