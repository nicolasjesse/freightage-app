class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable   
             
  belongs_to :company, optional: true

  enum user_type: { company_member: 1, admin: 0 }

  validate :email_domain_has_no_company_related

  before_validation :assigns_type_and_company

  private

  def assigns_type_and_company
    email_domain = email.split('@')[1]
    if email_domain == 'sistemadefrete.com.br' || email_domain == 'freightagesystem.com'
      self.user_type = 'admin'
    else
      self.company = Company.find_by(email_domain: email_domain)
      self.user_type = 'company_member'
    end
  end

  def email_domain_has_no_company_related
    if !company && user_type == 'company_member'
      errors.add :email, 'theres no company with that email domain'
    end
  end

end
