class User < ActiveRecord::Base
  has_one :user_detail
  has_one :prefecture
  has_one :city
  has_many :chat_rooms_users
  has_many :chat_rooms, through: :chat_rooms_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
