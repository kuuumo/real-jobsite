class RoomsController < ApplicationController

  def show
    @entry = Entry.find_by(room_id: params[:id])
    @user = User.find_by(id: @entry.user_id)
    @room = Room.find(params[:id])
    @messages = Message.where(room_id: @room.id)
    @message = Message.create
    render action: :show2
  end

  def create
    @room = Room.create!
    @entry = Entry.new(user_id: params[:user_id], from_id: current_user.id,
                          room_id: @room.id)
    @entry.save!
    byebug
    redirect_to @room
  end


  private
    def entry_params
      params.require(:entry).permit(:user_id, :from_id, :room_id)
    end

end
