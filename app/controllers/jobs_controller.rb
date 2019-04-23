class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    redirect_to @job
  end

  private

    def job_params
      params.require(:job).permit(:title, :content)
    end

end
