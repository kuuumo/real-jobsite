class MessagesController < ApplicationController

  def create
    @room = Room.find(message_params[:room_id])
    @message = Message.create!(content: message_params[:content],
                              user_id: current_user.id, room_id: message_params[:room_id])
    redirect_to @room
  end

  private

    def message_params
      params.require(:message).permit(:content, :user_id, :room_id)
    end

end
