class RoomsController < ApplicationController
  def new
    @user = User.find(params[:id])
    # Hack: validationの効率化検討
    room_ids = @user.user_rooms.pluck(:room_id)
    @user_room = UserRoom.where(room_id: room_ids).where(user_id: current_user.id).first
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
    params.require(:room).permit(:name, user_rooms_attributes: :user_id)
  end
end
