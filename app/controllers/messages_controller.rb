class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = Message.where(room_id: @room.id)
    @receiver = User.find_by(id: @room.receiver)
    @applicant = User.find_by(id: @room.sender)
  end

  def create
    @message = Message.create(message_params)
    redirect_to room_messages_path(params[:room_id])
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :room_id, :content)
    end

end
