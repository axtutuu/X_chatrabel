class ChatsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @me = @room.user_rooms.where(user_id: current_user.id)
    if @me.blank?
      not_found
    end
    @chat = Chat.new
  end
end
