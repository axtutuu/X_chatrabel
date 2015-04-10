class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :chat_room_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.text    :message, null: false, defalut: ""

      t.timestamps null: false
    end
  end
end
