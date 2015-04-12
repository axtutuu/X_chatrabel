class CreateUserRooms < ActiveRecord::Migration
  def change
    create_table :user_rooms do |t|
      t.references :user, index: true, null: false
      t.references :room, index: true, null: false

      t.timestamps null: false
    end
  end
end
