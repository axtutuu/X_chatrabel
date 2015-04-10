class UserDetail < ActiveRecord::Base
  belongs_to :user
  # paperclip
    has_attached_file :avatar, :styles => { medium: "300x300>", thumb: "100x100>"}
    validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)
end
