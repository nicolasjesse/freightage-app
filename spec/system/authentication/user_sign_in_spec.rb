require 'rails_helper'

describe 'User sign in' do
  it 'successfully' do
    User.create!(email: 'user@freightagesystem.com', password: 'password')

    visit root_path
    click_on 'Log in'

    within('form') do
      fill_in 'Email', with: 'user@freightagesystem.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    within('nav') do
      expect(page).not_to have_content 'Log in'
      expect(page).to have_button 'Log out'
      expect(page).to have_content 'user@freightagesystem.com'
    end
    expect(page).to have_content 'Signed in successfully'
  end

  it 'and logs out' do
    User.create!(email: 'user@freightagesystem.com', password: 'password')

    visit root_path
    click_on 'Log in'

    within('form') do
      fill_in 'Email', with: 'user@freightagesystem.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end
    click_on 'Log out'

    expect(page).to have_content 'Signed out successfully'
    expect(page).to have_content 'Log in'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'user@freightagesystem.com'
  end
end