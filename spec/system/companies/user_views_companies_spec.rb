require 'rails_helper'

describe 'User views companies' do
  it 'succesfully' do
    company = Company.create!(corporate_name: 'Fic SMLT', brand_name: 'Fic Entregas',
                              email_domain: 'fic.com.br', cnpj: '91827364591827',
                              address: 'Bairro Fic, Cidade Fic', active: true)   
    another_company = Company.create!(corporate_name: 'ABC SMLT', brand_name: 'ABC Entregas',
                                      email_domain: 'abc.com.br', cnpj: '91844364591827',
                                      address: 'Bairro ABC, Cidade ABC', active: true)   

    visit root_path
    click_on 'Companies'

    expect(page).to have_content('Fic Entregas')
    expect(page).to have_content('fic.com.br')
    expect(page).to have_content('ABC Entregas')
    expect(page).to have_content('abc.com.br')
    expect(page).not_to have_content('No companies registered')
  end

  it 'with no companies registered' do
    visit root_path
    click_on 'Companies'

    expect(page).to have_content('No companies registered')
  end
end