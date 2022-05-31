require 'rails_helper'

describe 'User views company vehicles' do
  it 'list' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true) 
    Vehicle.create!(plate: 'ABC-1234', brand: 'BMW', model: 'M4',
                    year_of_fabrication: '2020', capacity: 10000,
                    company: company)

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Vehicles'
    end

    expect(page).to have_content 'BMW'
    expect(page).to have_content 'M4'
    expect(page).to have_content '2020'
  end

  it 'details' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true) 
    Vehicle.create!(plate: 'ABC-1234', brand: 'BMW', model: 'M4',
                    year_of_fabrication: '2020', capacity: 10000,
                    company: company)

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Vehicles'
    end
    click_on 'BMW'

    expect(page).to have_content 'ABC-1234'
    expect(page).to have_content '10000'
  end
end