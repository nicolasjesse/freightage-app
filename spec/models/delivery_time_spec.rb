require 'rails_helper'

RSpec.describe DeliveryTime, type: :model do
  describe '#valid?' do
    context 'presence:' do
      it 'true when everything is present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(min_distance: 0, max_distance: 100, days: 2, company: company)

        expect(delivery_time).to be_valid
      end

      it 'false when min_distance is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(max_distance: 100, days: 2, company: company)

        expect(delivery_time).not_to be_valid
      end

      it 'false when max_distance is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(min_distance: 0, days: 2, company: company)

        expect(delivery_time).not_to be_valid
      end

      it 'false when days is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(min_distance: 0, max_distance: 100, company: company)

        expect(delivery_time).not_to be_valid
      end

      it 'false when company is not present' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(min_distance: 0, max_distance: 100, days: 2)

        expect(delivery_time).not_to be_valid
      end
    end

    context 'greater than or equal 0:' do
      it 'false when min_distance is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(min_distance: -1, max_distance: 1, days: 2, company: company)

        expect(delivery_time).not_to be_valid
      end

      it 'false when max_distance is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(min_distance: 0, max_distance: -1, days: 2, company: company)

        expect(delivery_time).not_to be_valid
      end

      it 'false when days is less than 0' do
        company = Company.create!(corporate_name: 'Fic SLMT', brand_name: 'Fic Entregas',
                                  email_domain: 'fic.com.br', cnpj: '96.797.547/0001-39',
                                  address: 'Bairro Fic, Cidade Fic') 
        
        delivery_time = DeliveryTime.new(min_distance: 0, max_distance: 1, days: -1, company: company)

        expect(delivery_time).not_to be_valid
      end
    end
  end
end
