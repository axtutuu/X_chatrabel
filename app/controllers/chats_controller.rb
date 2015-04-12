class ChatsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @chat = Chat.new
  end

  def create
    chat = Chat.new(create_params)
    chat.save

    redirect_to chats_path(room_id: chat.room_id)
  end

  private
  def create_params
    params.require(:chat).permit(:message, :room_id).merge(user_id: current_user.id)
  end
end
