class AddRoomNameToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_name, :string
  end
end
