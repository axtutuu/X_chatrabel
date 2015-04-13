class ChatsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @me = @room.user_rooms.where(user_id: current_user.id)
    @passive_user = @room.user_rooms.where.not(user_id: current_user.id).first
    if @me.blank?
      not_found
    end
    @chat = Chat.new
  end
end
