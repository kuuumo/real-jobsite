class LikesController < ApplicationController

  def create
    @job = Job.find(params[:id])
    @job.likes.create(user_id: current_user.id)
    redirect_to @job
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to Job.find(params[:job_id])
  end

end