class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
    @likes_count = @job.likes.count
    render action: :show2
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(content: job_params[:content], title: job_params[:title], user_id: current_user.id)
    redirect_to @job
  end

  private

    def job_params
      params.require(:job).permit(:title, :content, :user_id)
    end

end
