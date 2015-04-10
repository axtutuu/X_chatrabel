class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.integer :user_id, null: false, index: true, unique: true
      t.integer :prefecture_id, null: false, index: true
      t.integer :city_id, null: false, index: true
      t.string  :family_name, null: false, default: "Family Name"
      t.string  :first_name, null: false, default: "First Name"

      t.timestamps null: false
    end
  end
end
