class ChangeColumnFromUser < ActiveRecord::Migration
  def change
    add_column :users, :family_name, :string, after: :id
    add_column :users, :first_name, :string, after: :family_name
    add_column :users, :prefecture_id, :integer, null: false, index: true, after: :first_name
    add_column :users, :city_id, :integer, null: false, index: true, after: :prefecture_id
  end
end
