class Room < ActiveRecord::Base
  has_many :user_rooms
  accepts_nested_attributes_for :user_rooms

  has_many :users, through: :user_rooms

  has_many :chats
end
