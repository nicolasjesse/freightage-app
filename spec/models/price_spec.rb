require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid?' do
    context 'presence:' do
      it 'true when everything is present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 5000, value_by_km: 0.81, company: company)

        expect(price).to be_valid
      end

      it 'false when min_product_volume is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 5000, value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when max_product_volume is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, min_product_weight: 0,
                          max_product_weight: 5000, value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when min_product_weight is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1,
                          max_product_weight: 5000, value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when max_product_weight is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when value_by_km is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 5000, company: company)

        expect(price).not_to be_valid
      end

      it 'false when company is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 5000, value_by_km: 0.81)

        expect(price).not_to be_valid
      end
    end

    context 'greater than or equal 0:' do
      it 'false when min_product_volume is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: -1, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: 5000, value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when max_product_volume is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: -1, min_product_weight: 0,
                          max_product_weight: 5000, value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when min_product_weight is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1, min_product_weight: -1,
                          max_product_weight: 5000, value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when max_product_weight is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1, min_product_weight: 0,
                          max_product_weight: -1, value_by_km: 0.81, company: company)

        expect(price).not_to be_valid
      end

      it 'false when value_by_km is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        price = Price.new(min_product_volume: 0, max_product_volume: 1, min_product_weight: -1,
                          max_product_weight: 5000, value_by_km: -0.5, company: company)

        expect(price).not_to be_valid
      end
    end
  end
end
