class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @user = User.find(id: @room.receiver)
  end

  def index
  end

  def create
    @room = Room.create(sender: params[:user_id], receiver: current_user.id)
    redirect_to room_messages_path(@room)
  end

  private
    def room_params
      params.require(:room).permit(:sender, :receiver)
    end
end
