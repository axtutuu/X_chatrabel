class AddKanaToCities < ActiveRecord::Migration
  def change
    add_column :cities, :kana, :string, after: :name
  end
end
