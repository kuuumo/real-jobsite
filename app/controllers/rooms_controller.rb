class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @user = User.find(id: @room.receiver)
  end

  def index
    @userRooms = Room.where(receiver: params[:user_id])
  end

  def create
    @room = Room.create(sender: current_user.id, receiver: params[:user_id])
    redirect_to room_messages_path(@room)
  end

  private
    def room_params
      params.require(:room).permit(:sender, :receiver)
    end
end
