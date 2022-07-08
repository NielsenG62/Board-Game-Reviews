require 'rails_helper'

describe 'get_game_id' do
  it "returns a 200 success when API call is made" do
    response = Comment.get_game_id("Root")
    expect(response.code).to(eq(200))
  end

  it 'returns the game id' do
    response = Comment.get_game_id("Root")
    expect(response["items"]['item']['id']).to(eq("237182"))
  end
end

describe 'get_comments' do
  it "returns a 200 success when API call is made" do
    response = Comment.get_comments("Root")
    expect(response.code).to(eq(200))
  end
end