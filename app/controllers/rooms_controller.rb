class RoomsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @room = Room.new
    @room.user_rooms.build
  end

  def create
    room = Room.new(create_params)
    room.save

    #自身のユーザーも作成
    UserRoom.create(user_id: current_user.id, room_id: room.id)

    redirect_to chats_path(room_id: room.id)
  end

  private
  def create_params
    params.require(:room).permit(:name, user_rooms_attributes: [:user_id])
  end

  def find_room
    Room.includes(:users).where("users.id = ?", current_user.id).references(:users)
  end
end
