require 'rails_helper'

describe 'User views homepage' do
  it 'successfully' do
    visit root_path

    expect(page).to have_content('Freightage')
  end
end