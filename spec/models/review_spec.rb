require 'rails_helper'

describe 'get_game_id' do
  it "returns a 200 success when API call is made" do
    response = Review.get_game_id("Root")
    expect(response.code).to(eq(200))
  end

  it 'returns the game id' do
    response = Review.get_game_id("Root")
    expect(response["items"]['item']['id']).to(eq("237182"))
  end
end

describe 'get_comments' do
  it "returns a 200 success when API call is made" do
    response = Review.get_comments("7+wonders")
    expect(response).not_to be_empty
  end
end

describe 'filter_comments' do
  it 'correctly filters the reviews down to english' do
    response = Review.filter_comments("Gloomhaven")
    expect(response).not_to be_empty
  end
end