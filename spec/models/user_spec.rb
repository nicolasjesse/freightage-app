require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it '' do
      
    end
  end
  describe '#user_type' do
    it "email_domain 'sistemadefrete.com.br' makes a user of type admin" do
      user = User.create!(email: 'user@sistemadefrete.com.br', password: 'password')

      expect(user.user_type).to eq 'admin'
    end

    it "email_domain of a company makes a user of type company_member" do
      company = Company.create!(corporate_name: 'Sedex LTDA', brand_name: 'Sedex',
                            email_domain: 'sedex.com.br', cnpj: '96.797.547/0001-39',
                            address: 'Bairro Fic, Cidade Fic') 
      user = User.create!(email: 'user@sedex.com.br', password: 'password')

      expect(user.user_type).to eq 'company_member'
    end
  end
end
