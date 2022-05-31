require 'rails_helper'

describe 'Admin register service order' do
  it 'successfully' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true)
    Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                  max_product_weight: 10000, value_by_km: 0.81, company: company)
    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Search'
    end
    within('.search-prices') do
      fill_in 'Height', with: '0.1'
      fill_in 'Width', with: '0.1'
      fill_in 'Depth', with: '0.1'
      fill_in 'Weight', with: '3333'
      fill_in 'Distance', with: '240'
      click_on 'Search'    
    end
    click_on 'Open Service Order'

    service_order = ServiceOrder.first
    expect(service_order.code.length).to eq 15
    expect(service_order.company.brand_name).to eq 'Fic Entregas'
    expect(service_order.price.value_by_km).to eq 0.81
    expect(service_order.distance).to eq 240
    expect(service_order.cost).to eq 240 * 0.81
  end

  it 'and fill all the fields after' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
      email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
      address: 'Bairro Fic, Cidade Fic', active: true)
      Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
      max_product_weight: 10000, value_by_km: 0.81, company: company)
      admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
      login_as(admin, :scope => :user)

      visit root_path
      within('nav') do
        click_on 'Search'
      end
      within('.search-prices') do
        fill_in 'Height', with: '0.1'
        fill_in 'Width', with: '0.1'
        fill_in 'Depth', with: '0.1'
        fill_in 'Weight', with: '3333'
        fill_in 'Distance', with: '240'
        click_on 'Search'    
      end
      click_on 'Open Service Order'
      fill_in 'Product address', with: 'Street 01, New york'
      fill_in 'Product code', with: 'AGULHA-IDK'
      fill_in 'Recipient address', with: 'Street 04, California'
      fill_in 'Recipient name', with: 'Mark Zuckemberg'
      fill_in 'Recipient id', with: '38.613.769-9'
      click_on 'Save'

      service_order = ServiceOrder.first
      expect(service_order.product_address).to eq 'Street 01, New york'
      expect(service_order.product_code).to eq 'AGULHA-IDK'
      expect(service_order.recipient_address).to eq 'Street 04, California'
      expect(service_order.recipient_name).to eq 'Mark Zuckemberg'
      expect(service_order.recipient_id).to eq '38.613.769-9'
  end
end