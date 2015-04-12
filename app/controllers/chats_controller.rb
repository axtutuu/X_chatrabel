class ChatsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @chat = Chat.new
  end

  def create
    chat = Chat.new(create_params)
    chat.save

    Pusher['general_channel'].trigger('chat_event', {
      message: chat.message
    })

    render :text => 'OK', :status => 200
  end

  # TODO: 現在不使用
  def post
    chat = Chat.new(create_params)
    chat.save

    Pusher['general_channel'].trigger('chat_event', {
      message: params[:message],
      name: current_user.family_name
    })
    render :text => 'OK', :status => 200
  end

  private
  def create_params
    params.permit(:message, :room_id).merge(user_id: current_user.id)
  end
end
