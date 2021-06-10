class AddRoomReservationConfirmedToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :reservation_confirmed, :datetime
  end
end
