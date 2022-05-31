require 'rails_helper'

describe 'Admin views service orders' do
  it 'index' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true)
    price = Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                  max_product_weight: 10000, value_by_km: 0.81, company: company)
    service_order = ServiceOrder.create!(product_height: 0.1, product_width: 0.1, product_depth: 0.1,
                                         product_weight: 3333, distance: 240, product_address: 'Street 01',
                                         product_code: 'ABC-2144', recipient_address: 'St 02', recipient_name: 'Mark',
                                         recipient_id: '1234-234-1', company: company, price: price)

    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Service Orders'
    end

    expect(page).to have_content service_order.code
    expect(page).to have_content 'PENDING'
  end

  it 'details' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true)
    price = Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                  max_product_weight: 10000, value_by_km: 0.81, company: company)
    service_order = ServiceOrder.create!(product_height: 0.1, product_width: 0.1, product_depth: 0.1,
                                         product_weight: 3333, distance: 240, product_address: 'Street 01',
                                         product_code: 'ABC-2144', recipient_address: 'St 02', recipient_name: 'Mark',
                                         recipient_id: '1234-234-1', company: company, price: price)

    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Service Orders'
    end
    click_on service_order.code

    expect(page).to have_content 'Street 01'
    expect(page).to have_content 'St 02'
    expect(page).to have_content 'Fic Entregas'
  end
end