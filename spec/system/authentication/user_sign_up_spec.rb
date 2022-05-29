require 'rails_helper'

describe 'User sign up' do
  it 'successfully' do
    visit root_path
    click_on 'Log in'
    click_on 'Sign up'
    fill_in 'Name', with: 'Michael'
    fill_in 'Email', with: 'user22@freightagesystem.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully'
    expect(page).to have_content 'user22@freightagesystem.com'
    expect(page).to have_button 'Log out'
    user = User.last
    expect(user.name).to eq 'Michael'
  end
end