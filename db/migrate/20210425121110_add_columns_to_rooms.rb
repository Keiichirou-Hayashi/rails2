class AddColumnsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_name, :string
    add_column :rooms, :introduction, :string
    add_column :rooms, :price, :integer
    add_column :rooms, :address, :string
  end
end
