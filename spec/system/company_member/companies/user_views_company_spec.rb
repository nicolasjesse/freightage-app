require 'rails_helper'

describe 'User views company' do
  it 'successfully' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true) 
                              delivery_time = DeliveryTime.create!(min_distance: 0, max_distance: 1234, days: 2, company: company)
    price = Price.create!(min_product_volume: 3, max_product_volume: 0.67, min_product_weight: 0,
                      max_product_weight: 10000, value_by_km: 0.81, company: company)

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Home'
    end

    expect(page).to have_content 'Company Details'
    expect(page).to have_content 'Fic SMLT'
    expect(page).to have_content '1234'
    expect(page).to have_content '2'
    expect(page).to have_content '0.67'
    expect(page).to have_content '10000'
    expect(page).to have_content '0.81'
    expect(page).to have_content '3'
  end
end