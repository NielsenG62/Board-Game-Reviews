require 'rails_helper'

describe 'search process' do
  it 'searches a valid game with the filter' do
    visit reviews_path
    fill_in 'name', with: 'Targi'
    click_on 'Search (Filter)'
    expect(page).to have_content 'Filtered'
  end

  it 'searches a valid game with no filter' do
    visit reviews_path
    fill_in 'name', with: 'Targi'
    click_on 'Search (No Filter)'
    expect(page).to have_content 'Unfiltered'
  end
end

