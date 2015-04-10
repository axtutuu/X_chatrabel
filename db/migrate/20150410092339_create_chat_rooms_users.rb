class CreateChatRoomsUsers < ActiveRecord::Migration
  def change
    create_table :chat_rooms_users do |t|
      t.integer :chat_room_id
      t.integer :user_id
    end
  end
end
