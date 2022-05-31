require 'rails_helper'

describe 'User views homepage' do
  it 'successfully' do
    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path

    expect(page).to have_content('Freightage')
    expect(page).to have_content('admin@freightagesystem.com')
    expect(page).to have_content('Log out')
  end
end