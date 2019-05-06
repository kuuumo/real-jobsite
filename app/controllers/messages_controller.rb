class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = Message.where(room_id: @room.id)
    @user = User.find_by(id: @room.receiver)
  end

  def create
    @message = Message.create(user_id: message_params[:user_id], room_id: params[:room_id],
                              content: message_params[:content])
    redirect_to room_messages_path(params[:room_id])
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :room_id, :content)
    end

end
