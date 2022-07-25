class ReviewsController < ApplicationController
  def index
    render :index
  end

  def results
    @name = params[:name]
    render :results
  end
end