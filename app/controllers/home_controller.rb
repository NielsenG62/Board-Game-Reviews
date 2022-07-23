class HomeController < ApplicationController

  def index
    render :index
  end

  def search
    @name = Review.filter_comments(params[:name])
    render :search
  end
end