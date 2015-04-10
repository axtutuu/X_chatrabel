class AddAttachmentAvatarToUserDetails < ActiveRecord::Migration
  def self.up
    change_table :user_details do |t|
      t.attachment :avatar, after: :first_name
    end
  end

  def self.down
    remove_attachment :user_details, :avatar
  end
end
