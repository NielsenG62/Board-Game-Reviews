require 'rails_helper'

describe UnfilteredReview do

  before :all do
    @id_response = Review.get_game_id("Root")
    @comment_response = Review.get_comments("7+wonders")
    @filter_response = Review.filter_comments("7+wonders")
  end

  it "returns a 200 success when API call is made" do
    expect(@id_response.code).to(eq(200))
  end

  it 'returns the game id' do
    expect(@id_response["items"]['item']['id']).to(eq("237182"))
  end

  it "returns a string of reviews" do
    expect(@comment_response).to be_a(String)
  end

  it 'produces a hash of the RAKE results' do
    expect(@filter_response.keywords).to be_a(Hash)
  end

  it 'creates a csv file of the results' do
    expect(File).to exist("#{Rails.root}/data.csv")
  end
end