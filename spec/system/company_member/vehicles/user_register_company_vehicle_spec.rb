require 'rails_helper'

describe 'User register company vehicle' do
  it 'and fields do exists' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true) 

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Vehicles'
    end
    click_on '+ New Vehicle'

    expect(page).to have_field 'Brand'
    expect(page).to have_field 'Model'
    expect(page).to have_field 'Plate'
    expect(page).to have_field 'Year'
    expect(page).to have_field 'Capacity'
  end

  it 'successfully' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true) 

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Vehicles'
    end
    click_on '+ New Vehicle'

    fill_in 'Brand', with: 'BMW'
    fill_in 'Model', with: 'M3'
    fill_in 'Plate', with: 'ABC-1234'
    fill_in 'Year', with: '2020'
    fill_in 'Capacity', with: '100000'
    click_on 'Register Vehicle'

    expect(page).to have_content 'BMW'
    expect(page).to have_content 'M3'
    expect(page).to have_content '2020'
    expect(page).to have_content 'Vehicle succesfully registered'
  end
end