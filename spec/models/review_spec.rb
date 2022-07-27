require 'rails_helper'

describe Review do
  
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

  it 'returns the first edition if multiple have been published' do
    response = Review.get_game_id("monopoly")
    expect(response["items"]['item'][0]['id']).to(eq("1406"))
  end

  it "returns a string of reviews" do
    expect(@comment_response).to be_a(String)
  end

  it 'calls less than 5 pages if there are less than 500 reviews' do
    response = Review.get_comments("mountaineers")
    expect(@comment_response.split.size).to be > response.split.size
  end

  it 'correctly filters the reviews down to english' do
    expect(@filter_response.sentences[0].split.size).to be < @comment_response.split.size
  end

  it 'produces a hash of the RAKE results' do
    expect(@filter_response.keywords).to be_a(Hash)
  end
end