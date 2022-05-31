require 'rails_helper'

describe 'User changes service order status' do
  it 'to approved' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true)
    vehicle = Vehicle.create!(company: company, brand: 'BMW', model: 'M4', year_of_fabrication: '2020',
                              plate: 'abc-1234', capacity: 100000)
    price = Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 10000, value_by_km: 0.81, company: company)
    service_order = ServiceOrder.create!(product_height: 0.1, product_width: 0.1, product_depth: 0.1,
                                         product_weight: 3333, distance: 240, product_address: 'Street 01',
                                         product_code: 'ABC-2144', recipient_address: 'St 02', recipient_name: 'Mark',
                                         recipient_id: '1234-234-1', company: company, price: price, vehicle: vehicle,
                                         status: :pending)

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Service Orders'
    end
    click_on service_order.code
    click_on 'Approve Service Order'

    expect(page).not_to have_content 'Approve Service Order'
    expect(page).not_to have_content 'Disapprove Service Order'
    expect(page).to have_content 'Status: APPROVED'
    expect(page).to have_content 'Finish Service Order'
  end

  it 'to disapproved' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true)
    price = Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 10000, value_by_km: 0.81, company: company)
    service_order = ServiceOrder.create!(product_height: 0.1, product_width: 0.1, product_depth: 0.1,
                                         product_weight: 3333, distance: 240, product_address: 'Street 01',
                                         product_code: 'ABC-2144', recipient_address: 'St 02', recipient_name: 'Mark',
                                         recipient_id: '1234-234-1', company: company, price: price,
                                         status: :pending)

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Service Orders'
    end
    click_on service_order.code
    click_on 'Disapprove Service Order'

    expect(page).not_to have_content 'Finish Service Order'
    expect(page).not_to have_content 'Approve Service Order'
    expect(page).not_to have_content 'Disapprove Service Order'
    expect(page).to have_content 'Status: DISAPPROVED'
  end

  it 'to approved without vehicle' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true)
    price = Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 10000, value_by_km: 0.81, company: company)
    service_order = ServiceOrder.create!(product_height: 0.1, product_width: 0.1, product_depth: 0.1,
                                         product_weight: 3333, distance: 240, product_address: 'Street 01',
                                         product_code: 'ABC-2144', recipient_address: 'St 02', recipient_name: 'Mark',
                                         recipient_id: '1234-234-1', company: company, price: price,
                                         status: :pending)

    company_member = User.create!(email: 'companymember@fic.com.br', password: 'password')
    login_as(company_member, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Service Orders'
    end
    click_on service_order.code
    click_on 'Approve Service Order'

    expect(page).to have_content 'Approve Service Order'
    expect(page).to have_content 'Disapprove Service Order'
    expect(page).to have_content 'Status: PENDING'
    expect(page).not_to have_content 'Status: APPROVED'
    expect(page).not_to have_content 'Finish Service Order'
  end
end