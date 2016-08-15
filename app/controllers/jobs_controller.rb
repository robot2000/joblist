class JobsController < ApplicationController
  
  before_action :set_job, only: [:show, :destroy]

  def index
    @jobs = Job.all
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

  def set_job
    @job = Job.find(params[:id])
  end
end
