require 'rails_helper'

describe 'Admin search for prices' do
  it 'with no prices registered' do
    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Search'
    end
    
    within('.search-prices') do
      fill_in 'Height', with: '0'
      fill_in 'Width', with: '0'
      fill_in 'Depth', with: '0'
      fill_in 'Weight', with: '0'
      fill_in 'Distance', with: '100'
      click_on 'Search'    
    end

    expect(current_path).to eq '/prices/search'
    expect(page).to have_content 'No Prices Found'
  end

  it 'successfully' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true)
    another_company = Company.create!(corporate_name: 'ABC SMLT', brand_name: 'ABC Entregas',
                              email_domain: 'abc.com.br', cnpj: '96.797.547/0001-39',
                              address: 'Bairro ABC, Cidade ABC', active: true) 
    Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                              max_product_weight: 10000, value_by_km: 0.81, company: company)
    Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                                max_product_weight: 10000, value_by_km: 0.83, company: another_company)
    admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
    login_as(admin, :scope => :user)

    visit root_path
    within('nav') do
      click_on 'Search'
    end

    within('.search-prices') do
      fill_in 'Height', with: '0'
      fill_in 'Width', with: '0'
      fill_in 'Depth', with: '0'
      fill_in 'Weight', with: '0'
      fill_in 'Distance', with: '100'
      click_on 'Search'    
    end

    expect(page).to have_content 'Fic Entregas'
    expect(page).to have_content '$81.00'
    expect(page).to have_content 'ABC Entregas'
    expect(page).to have_content '$83.00'
  end

  it 'only see what fits the search' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
      email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
      address: 'Bairro Fic, Cidade Fic', active: true)
      another_company = Company.create!(corporate_name: 'ABC SMLT', brand_name: 'ABC Entregas',
            email_domain: 'abc.com.br', cnpj: '96.797.547/0001-39',
            address: 'Bairro ABC, Cidade ABC', active: true) 
      Price.create!(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
            max_product_weight: 10000, value_by_km: 0.81, company: company)
      Price.create!(min_product_volume: 1, max_product_volume: 2, min_product_weight: 1000,
              max_product_weight: 10000, value_by_km: 0.83, company: another_company)
      admin = User.create!(email: 'admin@freightagesystem.com', password: 'password')
      login_as(admin, :scope => :user)
      
      visit root_path
      within('nav') do
        click_on 'Search'
      end

      within('.search-prices') do
        fill_in 'Height', with: '0'
        fill_in 'Width', with: '0'
        fill_in 'Depth', with: '0'
        fill_in 'Weight', with: '0'
        fill_in 'Distance', with: '100'
        click_on 'Search'    
      end
      
      expect(page).to have_content 'Fic Entregas'
      expect(page).to have_content '$81.00'
      expect(page).not_to have_content 'ABC Entregas'
      expect(page).not_to have_content '$83.00'
  end
end