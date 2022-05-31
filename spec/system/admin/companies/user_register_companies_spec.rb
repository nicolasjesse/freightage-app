require 'rails_helper'

describe 'User register company' do
  it 'from the main menu' do
    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path
    click_on 'Companies'
    click_on 'New Company'

    expect(page).to have_content 'Register a Company'
    expect(page).to have_field 'Brand name'
    expect(page).to have_field 'Corporate name'
    expect(page).to have_field 'Email domain'
    expect(page).to have_field 'Cnpj'
    expect(page).to have_field 'Address'
  end

  it 'successfully' do
    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path
    click_on 'Companies'
    click_on 'New Company'

    fill_in 'Brand name', with: 'Fic Entregas'
    fill_in 'Corporate name', with: 'Fic LTDA'
    fill_in 'Email domain', with: 'fic.com.br'
    fill_in 'Cnpj', with: '96.797.547/0001-39'
    fill_in 'Address', with: 'Rua Fic, Bairro Fic, Fic'

    click_on 'Create Company'

    expect(current_path).to eq companies_path
    expect(page).to have_content 'Company succesfully registered'
    expect(page).to have_content 'Fic Entregas'
  end
end