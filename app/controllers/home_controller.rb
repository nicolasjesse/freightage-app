class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin?
      @companies = Company.where(active: true)
      render '/companies/index'
    else
      @company = current_user.company
      render '/companies/show'
    end
  end
end