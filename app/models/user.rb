class User < ActiveRecord::Base

  has_many :chats
  has_one :user_detail

  has_one :prefecture
  has_one :city

  has_many :rooms, through: :rooms
  has_many :user_rooms

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: {medium: '300x300>', thumb: '100x100>'}
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)

  private
  # TODO: 関連テーブルの作成は続きで
  #def build_user_detail
  #  @user = User.new
  #  @user.user_detail.build
  #  true
  #end

  #def create_params
  #  params.require(:user_detail).permit(:family_name, :first_name, :prefecture_id, :city_id, :avatar).merge(user_id: current_user.id)
  #end
end
