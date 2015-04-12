class SocketController < WebsocketRails::BaseController
  def initialize_session
    logger.debug("initialize chat controller")
  end

  def action
  end

  def connect_user
    logger.debug("'接続中---------------------------------'")
  end

  def new_message
    logger.debug("Call new_message : #{message[:name]}")

    chat = Chat.new(create_params)
    chat.save ? 'success' : 'error'

    # コネクションのあるユーザー全てにメッセージを送る
    room_id = message[:room_id]
    WebsocketRails["#{room_id}"].trigger(:new_message, message)
  end

  private
  def create_params
    params.permit().merge(user_id: current_user.id, message: message[:body], room_id: message[:room_id])
  end
end
