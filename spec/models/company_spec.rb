require 'rails_helper'

RSpec.describe Company, type: :model do
  describe '#valid?' do
    context 'presence:' do
      it 'true when everything is present' do
        company = Company.new(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
  
        expect(company).to be_valid
      end

      it 'false when only corporate_name is empty' do
        company = Company.new(corporate_name: '', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
  
        expect(company).not_to be_valid
      end
  
      it 'false when only brand_name is empty' do
        company = Company.new(corporate_name: 'Fic SLMT', brand_name: '',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
  
        expect(company).not_to be_valid
      end

      it 'false when only email_domain is empty' do
        company = Company.new(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: '', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
  
        expect(company).not_to be_valid
      end

      it 'false when only cnpj is empty' do
        company = Company.new(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '',
                                  address: 'Bairro Fic, Cidade Fic') 
  
        expect(company).not_to be_valid
      end

      it 'false when only address is empty' do
        company = Company.new(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: '') 
  
        expect(company).not_to be_valid
      end
    end

    context 'uniqueness:' do
      it 'false when corporate_name already exists' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic')
        other_company = Company.new(corporate_name: 'Fic SLMT', brand_name: 'Sedex',
                                  email_domain: 'sedex.com.br', cnpj: '62.609.949/0001-40',
                                  address: 'Bairro Sedex, Cidade Sedex')                                   
  
        expect(other_company).not_to be_valid
      end

      it 'false when brand_name already exists' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic')
        other_company = Company.new(corporate_name: 'Sedex', brand_name: 'Fic Entregas',
                                  email_domain: 'sedex.com.br', cnpj: '62.609.949/0001-40',
                                  address: 'Bairro Sedex, Cidade Sedex')                                   
  
        expect(other_company).not_to be_valid
      end

      it 'false when email_domain already exists' do
        company = Company.create!(corporate_name: 'Fic Entregas', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic')
        other_company = Company.new(corporate_name: 'Sedex LTDA', brand_name: 'Sedex',
                                  email_domain: 'fic.com.br', cnpj: '62.609.949/0001-40',
                                  address: 'Bairro Sedex, Cidade Sedex')                                   
  
        expect(other_company).not_to be_valid
      end

      it 'false when cnpj already exists' do
        company = Company.create!(corporate_name: 'Fic Entregas', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic')
        other_company = Company.new(corporate_name: 'Sedex LTDA', brand_name: 'Sedex',
                                  email_domain: 'sedex.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Sedex, Cidade Sedex')                                   
  
        expect(other_company).not_to be_valid
      end
    end

    context 'size 18:' do
      it 'true when cnpj has size 18' do
        company = Company.new(corporate_name: 'Fic Entregas', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic')                                  
  
        expect(company).to be_valid
      end

      it 'false when cnpj size is less than 18' do
        company = Company.new(corporate_name: 'Fic Entregas', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/00',
                                  address: 'Bairro Fic, Cidade Fic')
        expect(company).not_to be_valid
      end

      it 'false when cnpj size is more than 18' do
        company = Company.new(corporate_name: 'Fic Entregas', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-3933',
                                  address: 'Bairro Fic, Cidade Fic')
        expect(company).not_to be_valid
      end
    end
  end
end
