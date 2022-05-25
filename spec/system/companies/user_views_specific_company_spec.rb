require 'rails_helper'

describe 'User views specific company' do
  it 'successfully' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '58.139.059/0001-45',
                              address: 'Bairro Fic, Cidade Fic', active: true) 

    visit root_path
    click_on 'Companies'
    click_on 'Fic Entregas'

    expect(page).to have_content('Company Details')
    expect(page).to have_content('Fic SMLT')
  end
end