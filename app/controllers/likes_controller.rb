class LikesController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @job.likes.create(user_id: current_user.id)
  end

  def destroy
    Like.find(user_id: current_user, job_id: params[:job_id]).destroy
  end

end