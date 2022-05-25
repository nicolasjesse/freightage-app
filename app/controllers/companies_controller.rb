class CompaniesController < ApplicationController
  def index
    @companies = Company.where(active: true)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
    2.times { @company.prices.build }
    2.times { @company.delivery_times.build }
  end

  def create
    company_params = params.require(:company).permit(:brand_name, :corporate_name, :cnpj,
                                                     :email_domain, :address)
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = I18n.t("flashes.company_create_success")
      return redirect_to companies_path
    else
      flash.now[:notice] = I18n.t("flashes.company_create_error")
      render 'new'
    end
  end
end