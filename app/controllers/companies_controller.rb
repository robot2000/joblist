class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :destroy]

  def index
    @companies = Company.all.page(params[:page]).per(10)
  end
  
  def show
    # @company = Company.find(params[:id])

    @companies = Company.all
    @jobs = @company.jobs
  end
  
  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
 
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private

  def set_company
    @company = Company.find(params[:id])
  end
end
