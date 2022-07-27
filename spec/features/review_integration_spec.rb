require 'rails_helper'

describe 'search process' do
  it 'searches a valid game' do
    visit reviews_path
    fill_in 'name', with: 'Targi'
    click_on 'Search'
    expect(page).to have_content 'Results for:'
  end
end

describe 'error handling' do
  it 'gives an error on an invalid name' do
    visit reviews_path
    fill_in 'name', with: 'jfjfjfjf'
    click_on 'Search'
    expect(page).to have_content "Can't find a game by that name."
  end
end