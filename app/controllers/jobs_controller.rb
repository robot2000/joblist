class JobsController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :authorize,          except: [:index, :show]  # only admin can create new job
  before_action :set_job,            only:   [:show, :destroy]


  def index
    @jobs = Job.all.page(params[:page]).per(9)
    @companies = Company.all
  end
  
  def show
    book = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
 
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private

  def authorize
    redirect_to jobs_url, notice: "Access denied" unless current_user.try(:admin?) || current_user.try(:manager?)
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
end
