class ReviewsController < ApplicationController
  def index
    render :index
  end

  def search
    @name = params[:name]
    @reviews = Review.filter_comments(@name)
    render :results
  end

  def results
    render :results
  end
end